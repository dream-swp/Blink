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
    public var image: String = String.bk.defaultImageSystemName

}
// MARK: -
