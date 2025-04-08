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
        
        content { source }

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

    /// data source and Result AnyView
    private typealias Result = (_: () -> (message: Message, style: Style)) -> AnyView

    /// data source
    private typealias Source = (message: Message, style: Style)

    /// get style
    private var style: Style {
        config.style
    }

    /// get data
    private var message: Message {
        config.message
    }

    /// data source
    private var source: Source {
        (message, style)
    }

    /// blinkView
    private var blinkView: Result {

        return { result in
            let message = result().message
            let style = result().style
            #if os(macOS)
                return BlinkView(message: message, style: style)
                    .background(style.backgroundColor.opacity(0.6))
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
                    .opacity(0.7)
                    .eraseToAnyView
            #else
                return BlinkView(message: message, style: style)
                    .background(style.backgroundColor.opacity(0.8))
                    .cornerRadius(10)
                    .eraseToAnyView
            #endif

        }
    }

    /// content
    private var content: Result {
        return { result in
            let style = result().style
            switch style.padded {
            case .auto:
                return auto(result)
            case .full:
                return full(result)
            }
        }
    }

    /// auto
    private var auto: Result {

        return { result in
            let style = result().style
            switch style.position {
            case .top:
                return VStack {
                    blinkView(result)
                    Spacer()
                }
                .eraseToAnyView
            case .leading:
                return HStack {
                    blinkView(result)
                    Spacer()
                }
                .eraseToAnyView
            case .bottom:
                return VStack {
                    Spacer()
                    blinkView(result)
                }
                .eraseToAnyView
            case .trailing:
                return HStack {
                    Spacer()
                    blinkView(result)
                }
                .eraseToAnyView
            case .center:
                return VStack {
                    Spacer()
                    blinkView(result)
                    Spacer()
                }
                .eraseToAnyView
            }
        }
    }

    /// full
    private var full: Result {
        return { result in
            let style = result().style
            return VStack {
                
                if case .bottom = style.position {
                    Spacer()
                }
                
                blinkView(result)

                if case .top = style.position {
                    Spacer()
                }
            }
            .eraseToAnyView
        }
    }
}

// MARK: - Blink, Preview
#Preview {

    @ObservedObject var `default`: Config =
        .center { ("Data Reques", "Network loading, request data....") }
        .display { .init(isHidden: false) }

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
