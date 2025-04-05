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

    ///  Drives the `Blink` data model
    public struct Data: Sendable {

        /// `default`  Initialization
        public static let `default` = Data(title: "", message: "")

        /// Tips title
        public var title: String

        /// Tips message
        public var message: String

        /// Tips image name
        public var image: String = String.bk.defaultImageSystemName

        /// Initialization Data
        /// - Parameters:
        ///   - title:      Tips title
        ///   - message:    Tips message
        ///   - image:      Tips image
        public init(title: String, message: String, image: String = .bk.defaultImageSystemName) {
            self.title = title
            self.message = message
            self.image = image
        }

    }

}
// MARK: -
