//
// Xcore
// Copyright © 2018 Xcore
// MIT license, see LICENSE file for details
//

import UIKit

final public class HapticFeedback {
    private let createGenerator: () -> UIFeedbackGenerator
    private var generator: UIFeedbackGenerator?
    private var triggerBlock: () -> Void

    private init<T>(
        _ generator: @autoclosure @escaping () -> T,
        trigger: @escaping (T) -> Void
    ) where T: UIFeedbackGenerator {
        self.createGenerator = generator
        // Workaround for compiler error (Variable 'self.triggerBlock' used before being
        // initialized).
        self.triggerBlock = {}
        self.customTriggerBlock(trigger)
    }

    private func createGeneratorIfNeeded() {
        guard generator == nil else { return }
        generator = createGenerator()
    }

    /// Prepares the generator to trigger feedback.
    ///
    /// When you call this method, the generator is placed into a prepared state for
    /// a short period of time. While the generator is prepared, you can trigger
    /// feedback with lower latency.
    ///
    /// Think about when you can best prepare your generators. Call `prepare()`
    /// before the event that triggers feedback. The system needs time to prepare
    /// the Taptic Engine for minimal latency. Calling `prepare()` and then
    /// immediately triggering feedback (without any time in between) does not
    /// improve latency.
    ///
    /// To conserve power, the Taptic Engine returns to an idle state after any of
    /// the following events:
    ///
    /// - You trigger feedback on the generator.
    /// - A short period of time passes (typically seconds).
    /// - The generator is deallocated.
    ///
    /// After feedback is triggered, the Taptic Engine returns to its idle state. If
    /// you might trigger additional feedback within the next few seconds,
    /// immediately call `prepare()` to keep the Taptic Engine in the prepared
    /// state.
    ///
    /// You can also extend the prepared state by repeatedly calling the `prepare()`
    /// method. However, if you continue calling `prepare()` without ever triggering
    /// feedback, the system may eventually place the Taptic Engine back in an idle
    /// state and ignore any further `prepare()` calls until after you trigger
    /// feedback at least once.
    ///
    /// If you no longer need a prepared generator, remove all references to the
    /// generator object and let the system deallocate it. This lets the Taptic
    /// Engine return to its idle state.
    ///
    /// - Note: The `prepare()` method is optional; however, it is highly
    /// recommended. Calling this method helps ensure that your feedback has the
    /// lowest possible latency.
    public func prepare() {
        createGeneratorIfNeeded()
        generator?.prepare()
    }

    /// Triggers haptic feedback for the generator type.
    public func trigger() {
        createGeneratorIfNeeded()
        triggerBlock()
    }

    /// This deallocate the generator so that the Taptic Engine can return to its
    /// idle state.
    public func sleep() {
        generator = nil
    }

    private func customTriggerBlock<T>(_ trigger: @escaping (T) -> Void) {
        triggerBlock = { [weak self] in
            guard let generator = self?.generator as? T else { return }
            trigger(generator)
        }
    }
}

extension HapticFeedback {
    public static func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) -> HapticFeedback {
        switch style {
            case .light:
                return lightImpactFeedbackGenerator
            case .medium:
                return mediumImpactFeedbackGenerator
            case .heavy:
                return heavyImpactFeedbackGenerator
            case .soft:
                return .softImpactFeedbackGenerator
            case .rigid:
                return .rigidImpactFeedbackGenerator
            @unknown default:
                fatalError(because: .unknownCaseDetected(style))
        }
    }

    public static func notification(type: UINotificationFeedbackGenerator.FeedbackType) -> HapticFeedback {
        notificationFeedbackGenerator.customTriggerBlock { (generator: UINotificationFeedbackGenerator) in
            generator.notificationOccurred(type)
        }

        return notificationFeedbackGenerator
    }

    public static let selection = HapticFeedback(UISelectionFeedbackGenerator()) { $0.selectionChanged() }
}

// MARK: - UIImpactFeedbackGenerator

extension HapticFeedback {
    private static let lightImpactFeedbackGenerator = HapticFeedback(UIImpactFeedbackGenerator(style: .light)) {
        $0.impactOccurred()
    }

    private static let mediumImpactFeedbackGenerator = HapticFeedback(UIImpactFeedbackGenerator(style: .medium)) {
        $0.impactOccurred()
    }

    private static let heavyImpactFeedbackGenerator = HapticFeedback(UIImpactFeedbackGenerator(style: .heavy)) {
        $0.impactOccurred()
    }

    private static let softImpactFeedbackGenerator = HapticFeedback(UIImpactFeedbackGenerator(style: .soft)) {
        $0.impactOccurred()
    }

    private static let rigidImpactFeedbackGenerator = HapticFeedback(UIImpactFeedbackGenerator(style: .rigid)) {
        $0.impactOccurred()
    }
}

// MARK: - UINotificationFeedbackGenerator

extension HapticFeedback {
    private static let notificationFeedbackGenerator = HapticFeedback(UINotificationFeedbackGenerator()) { _ in }
}
