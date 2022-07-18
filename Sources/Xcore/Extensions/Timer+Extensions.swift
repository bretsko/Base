//
// Xcore
// Copyright © 2015 Xcore
// MIT license, see LICENSE file for details
//

import Foundation

extension Timer {
    /// Creates a one-time timer and schedules it on the current run loop in the
    /// default mode.
    ///
    /// After interval seconds have elapsed, the timer fires, executing block.
    ///
    /// **Usage**
    ///
    /// ```swift
    /// Timer.after(5) {
    ///     print("Hi once")
    /// }
    /// ```
    ///
    /// - Parameters:
    ///    - interval: The number of seconds between firings of the timer. If
    ///      interval is less than or equal to `0.0`, this method chooses the
    ///      nonnegative value of `0.0001` seconds instead.
    ///    - block: A block to be executed when the timer fires.
    /// - Returns: A new Timer object, configured according to the specified
    ///   parameters.
    @discardableResult
    public class func after(_ interval: TimeInterval, _ block: @escaping () -> Void) -> Timer {
        Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { _ in
            block()
        }
    }

    /// Creates a repeating timer and schedules it on the current run loop in the
    /// default mode.
    ///
    /// After interval seconds have elapsed, the timer fires, executing block.
    ///
    /// **Usage**
    ///
    /// ```swift
    /// var count = 0
    ///
    /// Timer.every(5) {
    ///     count += 1
    ///     print("Hi, count: \(count)")
    /// }
    /// ```
    ///
    /// - Parameters:
    ///    - interval: The number of seconds between firings of the timer. If
    ///      interval is less than or equal to `0.0`, this method chooses the
    ///      nonnegative value of `0.0001` seconds instead.
    ///    - block: A block to be executed when the timer fires.
    /// - Returns: A new Timer object, configured according to the specified
    ///   parameters.
    @discardableResult
    public class func every(_ interval: TimeInterval, _ block: @escaping () -> Void) -> Timer {
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            block()
        }
    }

    /// Creates a repeating timer and schedules it on the current run loop in the
    /// default mode.
    ///
    /// After interval seconds have elapsed, the timer fires, executing block.
    ///
    /// **Usage**
    ///
    /// ```swift
    /// var count = 0
    ///
    /// Timer.every(5) { timer in
    ///     count += 1
    ///     print("Hi, count: \(count)")
    ///
    ///     if count == 10 {
    ///         timer.invalidate()
    ///     }
    /// }
    /// ```
    ///
    /// - Parameters:
    ///    - interval: The number of seconds between firings of the timer. If
    ///      interval is less than or equal to `0.0`, this method chooses the
    ///      nonnegative value of `0.0001` seconds instead.
    ///    - block: A block to be executed when the timer fires. The block takes a
    ///      single `Timer` parameter and has no return value.
    /// - Returns: A new Timer object, configured according to the specified
    ///   parameters.
    @discardableResult
    public class func every(_ interval: TimeInterval, _ block: @escaping (Timer) -> Void) -> Timer {
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) {
            block($0)
        }
    }
}

// MARK: - Pause and Resume

extension Timer {
    private struct AssociatedKey {
        static var timerPauseDate = "timerPauseDate"
        static var timerPreviousFireDate = "timerPreviousFireDate"
    }

    //TODO: if iOS
    private var pauseDate: Date? {
        get { associatedObject(&AssociatedKey.timerPauseDate) }
        set { setAssociatedObject(&AssociatedKey.timerPauseDate, value: newValue) }
    }

    private var previousFireDate: Date? {
        get { associatedObject(&AssociatedKey.timerPreviousFireDate) }
        set { setAssociatedObject(&AssociatedKey.timerPreviousFireDate, value: newValue) }
    }

    public func pause() {
        pauseDate = Date()
        previousFireDate = fireDate
        fireDate = Date.distantFuture
    }

    public func resume() {
        guard let pauseDate = pauseDate, let previousFireDate = previousFireDate else { return }
        fireDate = Date(timeInterval: -pauseDate.timeIntervalSinceNow, since: previousFireDate)
    }
}

import Foundation

public protocol ExtensibleByAssociatedObject {}

extension ExtensibleByAssociatedObject {
    /// Returns the value associated with a given object for a given key.
    ///
    /// - Parameter key: The key for the association.
    /// - Returns: The value associated with the key for object.
    public func associatedObject<T>(_ key: UnsafeRawPointer) -> T? {
        objc_getAssociatedObject(self, key) as? T
    }

    /// Returns the value associated with a given object for a given key.
    ///
    /// - Parameters:
    ///   - key: The key for the association.
    ///   - defaultValue: The default value to return if there is no associated value.
    ///   - defaultValueAssociationPolicy: An optional value to save the
    ///                                    `defaultValue` so the next call will have
    ///                                     the associated object.
    /// - Returns: The value associated with the key for object.
    public func associatedObject<T>(_ key: UnsafeRawPointer, default defaultValue: @autoclosure () -> T, policy defaultValueAssociationPolicy: AssociationPolicy? = nil) -> T {
        guard let value = objc_getAssociatedObject(self, key) as? T else {
            let defaultValue = defaultValue()

            if let associationPolicy = defaultValueAssociationPolicy {
                setAssociatedObject(key, value: defaultValue, policy: associationPolicy)
            }

            return defaultValue
        }

        return value
    }

    /// Sets an associated value for a given object using a given key and
    /// association policy.
    ///
    /// - Parameters:
    ///   - key: The key for the association.
    ///   - value: The value to associate with the key for object. Pass `nil` to
    ///            remove an existing association.
    ///   - associationPolicy: The policy for the association. The default value is
    ///                        `.strong`.
    public func setAssociatedObject<T>(_ key: UnsafeRawPointer, value: T?, policy associationPolicy: AssociationPolicy = .strong) {
        objc_setAssociatedObject(self, key, value, associationPolicy.rawValue)
    }
}

// MARK: - AssociationPolicy

public enum AssociationPolicy {
    /// Specifies a weak reference to the associated object.
    case weak

    /// Specifies a strong reference to the associated object.
    ///
    /// The association is not made atomically.
    case strong

    /// Specifies a strong reference to the associated object.
    ///
    /// The association is made atomically.
    case strongAtomic

    /// Specifies that the associated object is copied.
    ///
    /// The association is not made atomically.
    case copy

    /// Specifies that the associated object is copied.
    ///
    /// The association is made atomically.
    case copyAtomic

    fileprivate var rawValue: objc_AssociationPolicy {
        switch self {
            case .weak:
                return .OBJC_ASSOCIATION_ASSIGN
            case .strong:
                return .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            case .strongAtomic:
                return .OBJC_ASSOCIATION_RETAIN
            case .copy:
                return .OBJC_ASSOCIATION_COPY_NONATOMIC
            case .copyAtomic:
                return .OBJC_ASSOCIATION_COPY
        }
    }
}

extension NSObject: ExtensibleByAssociatedObject {}
