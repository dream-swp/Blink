//
//  Config+Blur.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import SwiftUI

extension Config {

    public struct Blur: Sendable {

        /// Rapid Initialization
        public static let `default` = Blur()

        /// Background Color
        public var backgroundColor: Color = .red

        /// Background Opacity, The minimum is `0.6`, `< 0.6` Click the event will penetrate
        @DefaultValue(defaultValue: 0.6, value: 0) public var opacity: Double
    }

}
