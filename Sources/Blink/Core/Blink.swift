// The Swift Programming Language
// https://docs.swift.org/swift-book

import Combine
import SwiftUI

public struct Blink: View {

    public var config: Config

    public init(title: String, message: String) {
        self.init(config: .init(title: title, message: message))
    }

    public init(config: Config) {
        self.config = config
    }

    public var body: some View {

        HStack {
            if case .bottom = style.position {
                Spacer()
            }
            #if os(macOS)
                BlinkView(data: data, style: style)
                    .background(style.backgroundColor.opacity(0.6))
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)

            #else
                BlinkView(data: data, style: style)
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

extension Blink {

    private var style: Config.Style {
        config.style
    }

    private var data: Config.Data {
        config.data
    }

}


#Preview {
    @ObservedObject var `default` = Config.init(title: "Default", message: "Default Message`").display { .init(isHidden: false) }

    HStack(spacing: 30) {
        Button("`default`") {
            
        }
    }
    #if os(macOS)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    #endif
        .blink(`default`)

}
