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

    public var padded: Padded = .auto

    /// background color
    public var backgroundColor: Color = .bk.blinkBackground

    /// `Blink` Text
    public var title: Text?

    /// `Blink` Details
    public var details: Text?

    /// `Blink` Image
    public var image: Image?

    /// Initialization Style
    /// - Parameters:
    ///   - textAlignment:      textAlignment
    ///   - alignment:          alignment
    ///   - position:           position
    ///   - padded:             padded
    ///   - backgroundColor:    backgroundColor
    ///   - title:              title
    ///   - details:            details
    ///   - image:              image
    public init(textAlignment: TextAlignment = .center, alignment: Alignment = .horizontal, position: Position = .center, padded: Padded = .auto, backgroundColor: Color = .bk.blinkBackground, title: Text? = nil, details: Text? = nil, image: Image? = nil) {
        self.textAlignment = textAlignment
        self.alignment = alignment
        self.position = position
        self.padded = padded
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

    /// top position
    case top

    //  leading position
    case leading

    /// bottom position
    case bottom

    //  trailing position
    case trailing

    /// center position
    case center

}

/// `Blink` Display Padded
public enum Padded: Sendable {

    /// Padded auto
    case auto

    /// Padded full
    case full

}
// MARK: -
