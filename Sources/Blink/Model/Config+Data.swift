//
//  BKData.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Combine
import SwiftUI

extension Config {

    //  Drives the `ToastView` data model
    public struct Data: Sendable {

        public static let `default` = Data(title: "", message: "")

        /// Tips title
        public var title: String

        /// Tips message
        public var message: String

        /// Tips image name
        public var image: String = String.bk.defaultImageSystemName

    }

}
