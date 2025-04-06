//
//  BKData.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Combine
import SwiftUI

// MARK: - Config.Data
extension Config {

    ///  `Blink` data model
    public struct Data: Sendable {

        /// Rapid Initialization
        public static let `default`: Data = .init()

        /// Tips title
        public var title: String = ""

        /// Tips message
        public var message: String = ""

        /// Tips image name
        public var image: String = String.bk.defaultImageSystemName

    }

}
// MARK: -
