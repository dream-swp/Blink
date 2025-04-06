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
    public var data: Config.Data

    /// Display Style
    public var style: Config.Style = .default

    public var body: some View {

        switch style.alignment {
        case .horizontal:
            horizontal { source }

        case .vertical:
            vertical { source }
        }
    }

}

// MARK: - BlinkView extension
extension BlinkView {

    /// Callback data
    fileprivate typealias Source = (data: Config.Data, style: Config.Style)

    /// Callback data
    fileprivate var source: Source {
        (data, style)
    }

    /// Display message ( title & message )
    fileprivate var message: (_: () -> (alignment: HorizontalAlignment, data: Config.Data, style: Config.Style)) -> AnyView {
        return { reslut in

            let data = reslut().data
            let style = reslut().style

            if data.title.isEmpty && data.message.isEmpty {
                return EmptyView().eraseToAnyView
            }
            return VStack(alignment: reslut().alignment, spacing: 3) {
                if !data.title.isEmpty {
                    Text(LocalizedStringKey(data.title))
                        .font(style.titleFont)
                        .foregroundStyle(style.titleColor)
                }
                if !data.message.isEmpty {
                    Text(LocalizedStringKey(data.message))
                        .font(style.messageFont)
                        .opacity(0.9)
                        .foregroundStyle(style.messageColor)
                }

            }
            .eraseToAnyView

        }
    }

    /// Display system Image
    fileprivate var image: (_: () -> Source) -> AnyView {
        return { reslut in
            let data = reslut().data
            let style = reslut().style
            if data.image.isEmpty {
                return EmptyView().eraseToAnyView
            }
            return Image(systemName: data.image)
                .font(style.imageFont)
                .foregroundStyle(style.imageColor)
                .eraseToAnyView

        }
    }

    /// vertical: Vertical layout ( title & message: image )
    fileprivate var vertical: (_: () -> Source) -> AnyView {

        return { reslut in
            HStack {
                if case .trailing = reslut().style.textAlignment {
                    Spacer()
                }
                image(reslut)
                message { (.center, reslut().data, reslut().style) }

                if case .leading = reslut().style.textAlignment {
                    Spacer()
                }
            }
            .padding(10)
            .eraseToAnyView
        }
    }

    /// horizontal: Horizontal layout ( title & message: image )
    fileprivate var horizontal: (_: () -> Source) -> AnyView {
        return { reslut in
            HStack {
                if case .trailing = reslut().style.textAlignment {
                    Spacer()
                }
                VStack(spacing: 10) {
                    image(reslut)
                    message { (.center, reslut().data, reslut().style) }
                }

                if case .leading = reslut().style.textAlignment {
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
    BlinkView(data: .init(title: "Data Request", message: "Network loading, request data...."))
}

// MARK: -
