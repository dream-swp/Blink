//
//  Config.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Foundation
import SwiftUI

// MARK: - ConfigProperty
/// ConfigProperty Public properties
public protocol ConfigProperty: AnyObject {

    ///  Drives the `Blink` data model
    var data: Config.Data { get set }

    ///  Drives the `Blink` data model
    var style: Config.Style { get set }

    ///  Drives `Blink` display data model
    var display: Config.Display { get set }

}

extension ConfigProperty {

    /// Update data
    public var data: (_: () -> Config.Data) -> Self {
        return {
            self.data = $0()
            return self
        }
    }

    /// Update style
    public var style: (_: () -> Config.Style) -> Self {
        return {
            self.style = $0()
            return self
        }
    }

    /// Update style display
    public var display: (_: () -> Config.Display) -> Self {
        return {
            self.display = $0()
            return self
        }
    }
}

// MARK: - Config
/// Drives the `Blink` data model
public class Config: ObservableObject, ConfigProperty, @unchecked Sendable {

    ///  Drives the `Blink` data model
    @Published public var data: Data

    /// Drives the `Blink` style data model
    @Published public var style: Style = .default

    /// Drives `Blink` display data model
    @Published public var display: Display = .default

    /// Drives `Blink` Background Blur data model
    @Published public var blur: Blur?

    /// Initialize Config
    /// - Parameter data: Config.Data
    public init(_ data: Data) {
        self.data = data
        self.style = style
    }

    /// Convenient Initialization Config
    /// - Parameters:
    ///   - title:      title
    ///   - message:    message
    public convenience init(title: String, message: String) {
        let data = Data(title: title, message: message)
        self.init(data)
    }

    /// Rapid Initialization
    public static var config: (_: () -> (title: String, message: String)) -> Config {
        return {
            .init(title: $0().title, message: $0().message)
        }
    }
}

// MARK: -
