//
//  Message.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Combine
import SwiftUI

// MARK: - Config.Data

///  `Blink` data model
public struct Message: Sendable {

    /// Rapid Initialization
    public static let `default`: Message = .init()

    /// Tips title
    public var title: String = ""

    /// Tips details
    public var details: String = ""

    /// Tips image name
    public var image: Message.Image = .default

}

extension Message {

    public enum Image: Sendable {
        case `default`
        case info
        case infoFill
        case error
        case errorFill
        case success
        case successFill
        case customize(String)

        var rawValue: String {
            switch self {
            case .default: "tree"
            case .info: "exclamationmark.circle"
            case .infoFill: "exclamationmark.circle.fill"
            case .error: "xmark.circle"
            case .errorFill: "xmark.circle.fill"
            case .success: "checkmark.circle"
            case .successFill: "checkmark.circle.fill"
            case .customize(let value): value
            }
        }

    }

}
// MARK: -
