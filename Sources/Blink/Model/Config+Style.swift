//
//  Config+Style.swift
//  Blink
//
//  Created by Dream on 2025/4/1.
//

import SwiftUI

// MARK: - Config.Style
/// `Blink` Style data model
public struct Style: Sendable {

    /// Rapid Initialization
    public static let `default`: Style = .init()

    /// Title and Message text location
    public var textAlignment: TextAlignment = .center

    /// Image and Text Layout
    public var alignment: Alignment = .horizontal

    /// title & message and image position
    public var position: Position = .center

    /// background color
    public var backgroundColor: Color = .red

    /// title Text
    public var title: Text?

    /// details Text
    public var details: Text?

    /// details Image
    public var image: Image?

    /// Initialization Style
    /// - Parameters:
    ///   - textAlignment:      textAlignment
    ///   - alignment:          alignment
    ///   - position:           position
    ///   - backgroundColor:    backgroundColor
    ///   - title:              title
    ///   - details:            details
    ///   - image:              image
    public init(textAlignment: TextAlignment = .center, alignment: Alignment = .horizontal, position: Position = .center, backgroundColor: Color = .red, title: Text? = nil, details: Text? = nil, image: Image? = nil) {
        self.textAlignment = textAlignment
        self.alignment = alignment
        self.position = position
        self.backgroundColor = backgroundColor
        self.title = title
        self.details = details
        self.image = image
    }
}

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
// MARK: -
