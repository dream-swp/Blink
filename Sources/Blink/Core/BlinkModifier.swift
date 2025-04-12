//
//  BlinkModifier.swift
//  Blink
//
//  Created by Dream on 2025/4/4.
//

import SwiftUI

// MARK: - BlinkModifier
/// `BlinkModifier`,  Blink Modifier
struct BlinkModifier<Item>: ViewModifier where Item: View {
    
    /// isHidden is display
    @Binding var isHidden: Bool

    /// Content customized view
    private var content: () -> Item

    /// BlinkModifier Initialization
    /// - Parameters:
    ///   - isHidden: isHidden is display
    ///   - content:  content customized view
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

// MARK: - View Extension
extension View {
    
    ///  Display `Blink` view can be customized
    /// - Parameters:
    ///   - isHidden:   Drive `Blink` to display or hide
    ///   - blink:      Display the `Blink`
    /// - Returns:      BlinkModifier
    public func blink<Item>(_ isHidden: Bool, @ViewBuilder blink: @escaping () -> Item) -> some View where Item: View {
        let isHidden: Binding<Bool> = Binding.constant(isHidden)
        return self.modifier(BlinkModifier(isHidden, content: blink))
    }

    
    /// Display `Blink` view
    /// - Parameter config: Drives the `Blink` data model
    /// - Returns:  BlinkModifier
    public func blink(_ config: Config) -> some View {
        self.blink(config.display.isHidden, blink: { Blink(config) })
    }

    
    /// Display `Blink` view
    public var blink: (_: () -> Config) -> AnyView {
        return {
            blink($0()).eraseToAnyView
        }
    }

}
// MARK: -
