//
//  BlinkView.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Foundation
import SwiftUI

// MARK: - BlinkView
/// `BlinkView`:  Display `Blink` layer
public struct BlinkView: View {

    /// Display data
    public var message: Message

    /// Display Style
    public var style: Style = .default

    public var body: some View {

        switch style.padded {
        case .auto:
            auto { source }
        case .full:
            full { source }
        }
    }

}

// MARK: - BlinkView extension
extension BlinkView {

    /// Callback data source
    fileprivate typealias Source = (message: Message, style: Style)

    /// Callback Result
    fileprivate typealias Result = (() -> Source) -> AnyView

    /// Callback data
    fileprivate var source: Source {
        (message, style)
    }

    /// Display Title
    fileprivate var title: Result {
        return { reslut in
            let message = reslut().message
            let style = reslut().style

            if let title = style.title {
                return title.eraseToAnyView
            }
            return Text(LocalizedStringKey(message.title))
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundStyle(Color.bk.blinkTitle)
                .eraseToAnyView
        }
    }

    /// Display Details
    fileprivate var details: Result {
        return { reslut in
            let message = reslut().message
            let style = reslut().style

            if let details = style.details {
                return details.eraseToAnyView
            }
            return Text(LocalizedStringKey(message.details))
                .font(.subheadline)
                .foregroundStyle(Color.bk.blinkDetails)
                .eraseToAnyView
        }
    }

    /// Display system Image
    fileprivate var systemImage: Result {
        return { reslut in
            let message = reslut().message
            let style = reslut().style

            if let image = style.image {
                return image.eraseToAnyView
            }
            var mode: SymbolRenderingMode? = nil
            if case .default = message.image {
                mode = .multicolor
            }

            if #available(macOS 15.0, iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *) {
                return Image(systemName: message.image.rawValue)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white, .gray)
                    .symbolRenderingMode(mode)
                    .symbolEffect(.pulse.wholeSymbol, options: .repeat(.continuous))
                    .eraseToAnyView
            } else {
                return Image(systemName: message.image.rawValue)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.white, .gray)
                    .symbolRenderingMode(mode)
                    .symbolEffect(.pulse)
                    .eraseToAnyView
            }
        }
    }

    /// Display title & details & image
    fileprivate var information: (_ reslut: () -> (alignment: HorizontalAlignment, message: Message, style: Style)) -> AnyView {
        return { reslut in

            let data = reslut().message
            let style = reslut().style
            if data.title.isEmpty && data.details.isEmpty {
                return EmptyView().eraseToAnyView
            }
            return VStack(alignment: reslut().alignment, spacing: 3) {
                if !data.title.isEmpty {
                    title { (data, style) }
                }
                if !data.details.isEmpty {
                    details { (data, style) }
                }

            }.eraseToAnyView

        }
    }

    /// Display image
    fileprivate var image: (_: () -> Source) -> AnyView {
        return { reslut in
            let message = reslut().message
            let style = reslut().style
            if message.image.rawValue.isEmpty {
                return EmptyView().eraseToAnyView
            }
            return systemImage { (message, style) }

        }
    }

    /// auto
    fileprivate var auto: Result {

        return { reslut in

            let style = reslut().style

            switch style.alignment {

            case .vertical:
                return HStack {
                    image(reslut)
                    information { (.center, reslut().message, reslut().style) }
                }
                .padding(10)
                .eraseToAnyView

            case .horizontal:
                return VStack(spacing: 10) {
                    image(reslut)
                    information { (.center, reslut().message, reslut().style) }
                }
                .padding(10)
                .eraseToAnyView
            }

        }
    }

    /// full
    fileprivate var full: Result {

        return { reslut in

            HStack {
                let style = reslut().style
                if style.textAlignment == .trailing || style.textAlignment == .center {
                    Spacer()
                }

                auto(reslut)

                if style.textAlignment == .leading || style.textAlignment == .center {
                    Spacer()
                }
            }
            .padding(10)
            .eraseToAnyView
        }

    }

}

// MARK: - BlinkView Preview
#Preview {

    let style = Style(alignment: .horizontal, padded: .full)
    BlinkView(message: .init(title: "Data Request", details: "Network loading, request data....", image: .success), style: style)

}
// MARK: -
