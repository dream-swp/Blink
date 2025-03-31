//
//  BlinkView.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Foundation
import SwiftUI

struct BlinkView<Title, Message, Content>: View where Title: View, Message: View, Image: View {

    private let title: () -> Title
    private let message: () -> Message
    private let image: () -> Content

    public init(title: @escaping () -> Title, message: @escaping () -> Message, image: @escaping () -> Content) {
        self.title = title
        self.message = message
        self.image = image
    }

    var body: some View {
        HStack {
        }
    }

}

extension BlinkView {
}

#Preview {
    
        BlinkView {
            Text("1")
        } message: {
            Text("1")
                .backgroundStyle(.cyan.opacity(0.2))
        } image: {
    //        Image(systemName: "")
            Image.bk.default
        }

    //    BlinkView<Text, Text, Image>(title: "1111", message: "2")

}
