//
//  BlinkModifier.swift
//  Blink
//
//  Created by Dream on 2025/4/4.
//

import SwiftUI

struct BlinkModifier<Item>: ViewModifier where Item: View {

    @Binding var isHidden: Bool

    private var content: () -> Item

    init(_ isHidden: Binding<Bool>, content: @escaping () -> Item) {
        self._isHidden = isHidden
        self.content = content
    }

    func body(content: Content) -> some View {
        ZStack {
            content
            ZStack {
                if self.isHidden {
                    EmptyView()
                } else {
                    if let view = self.content() as? Blink, let blur = view.config.blur {
                        RoundedRectangle(cornerRadius: 5)
                            .fill()
                            .foregroundStyle(blur.backgroundColor)
                            .opacity(blur.opacity)
                            .ignoresSafeArea()
                        view
                    } else {
                        self.content()
                    }

                }
            }
        }
    }
}

extension View {

    public func blink<Item>(_ isHidden: Bool, @ViewBuilder blink: @escaping () -> Item) -> some View where Item: View {
        let isHidden: Binding<Bool> = Binding.constant(isHidden)
        return self.modifier(BlinkModifier(isHidden, content: blink))
    }

    public func blink(_ config: Config) -> some View {
        self.blink(config.display.isHidden, blink: { Blink(config: config) })
    }

    public var blink: (_: () -> Config) -> AnyView {
        return {
            blink($0()).eraseToAnyView
        }
    }

}
