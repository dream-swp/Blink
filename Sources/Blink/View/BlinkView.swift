//
//  BlinkView.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Foundation
import SwiftUI

public struct BlinkView: View {

    
    typealias Source = (data: Config.Data, style: Config.Style)
    
    public var data: Config.Data
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


extension BlinkView {

    var source: Source {
        (data, style)
    }
    
    var message: (_: () -> (alignment: HorizontalAlignment, data: Config.Data, style: Config.Style)) -> AnyView {

        return { reslut in
            VStack(alignment: reslut().alignment, spacing: 3) {
                Text(LocalizedStringKey(reslut().data.title))
                    .font(.headline)
                    .fontWeight(.bold)
                Text(LocalizedStringKey(reslut().data.message))
                    .font(.subheadline)
                    .opacity(0.9)
            }.eraseToAnyView

        }

    }

    /// Display Image
    var image: (_: () -> Source) -> AnyView {
        return {
            Image(systemName: $0().data.image)
                .font(.title)
                .font(.body).eraseToAnyView
        }
    }
    //
    var vertical: (_: () -> Source) -> AnyView {

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
            .foregroundStyle(.orange)
            .padding(10)
            .eraseToAnyView
        }
    }

    var horizontal: (_: () -> Source) -> AnyView {

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
            .foregroundStyle(.orange)
            .padding(10)
            .eraseToAnyView
        }
    }
}

#Preview {
    BlinkView(data: .init(title: "111", message: "222"))

}
