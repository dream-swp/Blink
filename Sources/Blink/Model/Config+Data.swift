//
//  BKData.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Combine
import SwiftUI


// 定义协议，约束关联类型为 Text
//protocol ViewProvider {
//    associatedtype Content: View where Content == Text
//    func getContent() -> Content
//}

extension Config {

    //  Drives the `ToastView` data model
    public struct Data: @unchecked Sendable {
        
        
      

        
//        typealias Content = View where

        /// Tips title
        public var title: Text

        /// Tips message
        public var message: Text

        /// Tips image
        public var image: Image = Image.bk.default
        
//        @MainActor var _title1: AnyView & Sendable

        public init(title: Text, message: Text, image: Image) {
            self.title = title
            self.message = message
            self.image = image
        }

        public init(title: String, message: String) {

            let titleText = Text(LocalizedStringKey(title))
                .font(.headline)
                .fontWeight(.bold)
//                .backgroundStyle(.cyan.opacity(0.2))

            let messageText = Text(LocalizedStringKey(message))
//                .opacity(0.9)
                .font(.subheadline)

            self.init(title: titleText, message: messageText, image: Image.bk.default)
        }

        public static var `default`: (_: () -> (title: String, message: String)) -> Self {
            return {
                .init(title: $0().title, message: $0().message)
            }

        }
        
        @MainActor var titleContent: some View {
            title.eraseToAnyView
        }

    }

}
