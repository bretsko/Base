//
// Xcore
// Copyright © 2021 Xcore
// MIT license, see LICENSE file for details
//

import SwiftUI

public struct StoryView<Content, Page>: View where Content: View, Page: Identifiable {
    @Environment(\.storyProgressIndicatorInsets) private var insets
    @ObservedObject private var storyTimer: StoryTimer
    private let pages: [Page]
    private let content: (Page) -> Content

    public init(
        interval: TimeInterval = 4,
        cycle: Count = .infinite,
        pages: [Page],
        @ViewBuilder content: @escaping (Page) -> Content
    ) {
        self.storyTimer = .init(
            pagesCount: pages.count,
            interval: interval,
            cycle: cycle
        )
        self.pages = pages
        self.content = content
    }

    public var body: some View {
        AxisGeometryReader { width in
            ZStack(alignment: .top) {
                content(pages[Int(storyTimer.progress)])
                    .frame(width: width)
                    .ignoresSafeArea()
                    .animation(.none)

                progressIndicator

                HStack(spacing: 0) {
                    advanceView(isLeft: true)
                    advanceView(isLeft: false)
                }
                .ignoresSafeArea()
            }
            .onAppear(perform: storyTimer.start)
            .onDisappear(perform: storyTimer.stop)
        }
    }

    private var progressIndicator: some View {
        HStack(spacing: 4) {
            ForEach(pages.indices) { index in
                StoryProgressIndicator(progress: storyTimer.progress(for: index))
            }
        }
        .apply {
            if let insets = insets {
                $0.padding(insets)
            } else {
                $0.padding()
            }
        }
    }

    private func advanceView(isLeft: Bool) -> some View {
        Rectangle()
            .foregroundColor(.clear)
            .contentShape(Rectangle())
            .onTapGesture {
                storyTimer.advance(by: isLeft ? -1 : 1)
            }
    }

    /// A block invoked on every cycle completion.
    ///
    /// - Parameter callback: The block to execute with a parameter indicating
    ///                       remaining number of cycles.
    public func onCycleComplete(_ callback: @escaping (_ remainingCycles: Count) -> Void) -> Self {
        storyTimer.onCycleComplete = callback
        return self
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
            makeColorStoryView()
    }

    private static func makeColorStoryView() -> some View {
        struct Colorful: Identifiable {
            let id: Int
            let color: Color
        }

        let pages = [Colorful(id: 1, color: .green), Colorful(id: 2, color: .blue), Colorful(id: 3, color: .purple)]

        return StoryView(cycle: .once, pages: pages) { page in
            ZStack {
                page.color
                VStack {
                    Text("Page")
                    Text("#")
                        .baselineOffset(70)
                        .font(.system(size: 100)) +
                        Text("\(page.id)")
                        .font(.system(size: 200))
                }
            }
        }.onCycleComplete { count in
            print(count)
        }
    }
}
