//
//  Config+Style.swift
//  Blink
//
//  Created by Dream on 2025/4/1.
//

import SwiftUI

// MARK: - Config.Style
extension Config {

    /// `Blink` Style data model
    public struct Style: Sendable {

        /// Rapid Initialization
        public static let `default`: Style = .init()

        /// Title and Message text location
        public var textAlignment: TextAlignment = .leading

        /// Image and Text Layout
        public var alignment: Alignment = .horizontal

        /// title & message and image position
        public var position: Position = .bottom

        /// background color
        public var backgroundColor: Color = .red

        /// title color
        public var titleColor: Color = .white

        /// message color
        public var messageColor: Color = .white

        /// title font
        public var titleFont: Font = .headline.bold()

        /// message font
        public var messageFont: Font = .subheadline
        
        /// image font
        public var imageFont: Font = .title.bold()
        
        /// image color
        public var imageColor: Color = .white
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

    /// `Blink` Display Position
    public enum Position: Sendable {

        /// Top position
        case top

        /// Bottom position
        case bottom

        /// Center position
        case center
    }
}
// MARK: -
