// The Swift Programming Language
// https://docs.swift.org/swift-book

import Combine
import SwiftUI

// MARK: - Blink
public struct Blink: View {

    /// Drives `Blink` configuration model
    public var config: Config

    /// Initialization Blink
    /// - Parameters:
    ///   - title:      title
    ///   - message:    message
    public init(title: String, message: String) {
        self.init(.init(title: title, details: message))
    }

    /// Initialization Blink
    /// - Parameter config: config
    public init(_ config: Config) {
        self.config = config
    }

    public var body: some View {

        VStack {
            if case .bottom = style.position {
                Spacer()
            }
            #if os(macOS)
                BlinkView(message: data, style: style)
                    .background(style.backgroundColor.opacity(0.6))
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .opacity(0.7)

            #else
                BlinkView(message: data, style: style)
                    .background(style.backgroundColor.opacity(0.8))
                    .cornerRadius(10)
            #endif

            if case .top = style.position {
                Spacer()
            }

        }
        .padding()
        .opacity(config.display.isHidden ? 0 : 1.0)
        .transition(.opacity)
        .onAppear {
            if config.display.isAutoHidden {
                config.display.cancellable = bk.isDelayHidden { (config, true) }
            }
        }
        .onDisappear {
            if config.display.isAutoHidden {
                config.display.cancellable?.cancel()
                config.display.cancellable = nil
            }
        }
        .onTapGesture {
            if config.display.isTapGesture {
                _ = bk.isDelayHidden { (config, false) }
            }
        }

    }

}
// MARK: - Blink, Extension
extension Blink {

    /// get style
    private var style: Style {
        config.style
    }

    /// get data
    private var data: Message {
        config.message
    }

}

extension Blink {

}

// MARK: - Blink, Preview
#Preview {
    
    @ObservedObject var `default`: Config = .init(title: "Data Request", details: "Network loading, request data....").display { .init(isHidden: false) }

    HStack(spacing: 30) {
        Button("`default`") {

        }
    }
    #if os(macOS)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    #endif
    .blink(`default`)

}
// MARK: -
