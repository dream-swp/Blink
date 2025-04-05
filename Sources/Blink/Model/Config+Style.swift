//
//  Config+Style.swift
//  Blink
//
//  Created by Dream on 2025/4/1.
//

import SwiftUI

extension Config {

    public struct Style: Sendable {

        /// Rapid Initialization
        public static let `default` = Style()

        /// Title and Message text location
        public var textAlignment: TextAlignment = .leading

        /// Image and Text Layout
        public var alignment: Alignment = .horizontal

        public var position: Position = .bottom

        public var backgroundColor: Color = .red

        public init(textAlignment: TextAlignment = .leading, alignment: Alignment = .horizontal, position: Position = .bottom, backgroundColor: Color = .red) {
            self.textAlignment = textAlignment
            self.alignment = alignment
            self.position = position
            self.backgroundColor = backgroundColor
        }

    }

}

extension Config.Style {

    /// Title and Message Text Alignment
    public enum TextAlignment: Sendable {
        /// Center display
        case center

        /// Display on the left
        case leading

        /// Display on the right
        case trailing
    }

    /// Image and Text layout
    public enum Alignment: Sendable {

        /// Horizontal layout
        case horizontal

        /// Vertical layout
        case vertical
    }

    public enum Position: Sendable {

        /// Top position
        case top

        /// Bottom position
        case bottom

        /// Center position
        case center
    }
}
