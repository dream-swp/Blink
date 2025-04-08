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
    var message: Message { get set }

    ///  Drives the `Blink` data model
    var style: Style { get set }

    ///  Drives `Blink` display data model
    var display: Display { get set }

    ///  Drives `Blink` blur data model
    var blur: Blur? { get set }

}

extension ConfigProperty {

    /// Update data
    public var message: (_: () -> Message) -> Self {
        return {
            self.message = $0()
            return self
        }
    }

    /// Update style
    public var style: (_: () -> Style) -> Self {
        return {
            self.style = $0()
            return self
        }
    }

    /// Update display display
    public var display: (_: () -> Display) -> Self {
        return {
            self.display = $0()
            return self
        }
    }

    /// Update style display
    public var blur: (_: () -> Blur) -> Self {
        return {
            self.blur = $0()
            return self
        }
    }
}

// MARK: - Config
// Drives the `Blink` data model
public class Config: ObservableObject, ConfigProperty, @unchecked Sendable {

    /// Callback return value
    public typealias Result = (_: () -> (title: String, message: String)) -> Config

    ///  Drives the `Blink` data model
    @Published public var message: Message

    /// Drives the `Blink` style data model
    @Published public var style: Style = .default

    /// Drives `Blink` display data model
    @Published public var display: Display = .default

    /// Drives `Blink` Background Blur data model
    @Published public var blur: Blur?

    /// Initialize Config
    /// - Parameter message: Config.Data
    public init(_ message: Message) {
        self.message = message
        self.style = .default
    }

    /// Convenient Initialization Config
    /// - Parameters:
    ///   - title:      title
    ///   - message:    message
    public convenience init(title: String, details: String) {
        let data = Message(title: title, details: details)
        self.init(data)
    }

}

extension Config {

    /// Rapid Initialization
    public static var `default`: Result {
        return {
            .init(title: $0().title, details: $0().message)
        }
    }

    /// Rapid Initialization position = top
    public static var top: Result {
        return { result in
            .default(result).style { .init(position: .top, padded: .auto) }
        }
    }

    /// Rapid Initialization position = leading
    public static var leading: Result {
        return { result in
            .default(result).style { .init(position: .leading, padded: .auto) }
        }
    }

    /// Rapid Initialization position = bottom
    public static var bottom: Result {
        return { result in
            .default(result).style { .init(position: .bottom, padded: .auto) }
        }
    }

    /// Rapid Initialization position = trailing
    public static var trailing: Result {
        return { result in
            .default(result).style { .init(position: .trailing, padded: .auto) }
        }
    }

    /// Rapid Initialization position = center
    public static var center: Result {
        return { result in
            .default(result).style { .init(position: .center, padded: .auto) }
        }
    }

}

// MARK: -
