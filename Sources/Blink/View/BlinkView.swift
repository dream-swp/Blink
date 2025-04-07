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
                .foregroundStyle(.white)
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
                .foregroundStyle(.white)
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

            return Image(systemName: message.image)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .eraseToAnyView
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
            if message.image.isEmpty {
                return EmptyView().eraseToAnyView
            }
            return systemImage { (message, style) }

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
                information { (.center, reslut().message, reslut().style) }
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
                    information { (.center, reslut().message, reslut().style) }
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
    BlinkView(message: .init(title: "Data Request", details: "Network loading, request data...."))
}
// MARK: -
