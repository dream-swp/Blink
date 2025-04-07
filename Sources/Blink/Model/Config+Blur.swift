//
//  Config+Blur.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import SwiftUI

// MARK: - Config.Blur
/// Drives `Blink` Background Blur
public struct Blur: Sendable {

    /// Rapid Initialization
    public static let `default`: Blur = .init()

    /// Background Color
    public var backgroundColor: Color = .red

    /// Background Opacity, The minimum is `0.6`, `< 0.6` Click the event will penetrate
    @BlinkDefaultValue(defaultValue: 0.6, value: 0) public var opacity: Double

    /// Initialization Blur
    /// - Parameters:
    ///   - backgroundColor: backgroundColor
    ///   - opacity:         opacity
    public init(backgroundColor: Color = .red, opacity: Double = 0) {
        self.backgroundColor = backgroundColor
        self.opacity = opacity
    }
}
// MARK: -
