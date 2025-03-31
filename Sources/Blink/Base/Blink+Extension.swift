//
//  Blink+Extension.swift
//  Blink
//
//  Created by Dream on 2025/3/30.
//

import SwiftUI

extension BK where Item == Image {
    public static var `default`: Image {
        Image(systemName: "checkmark.circle")
    }
}

extension View {

    public var eraseToAnyView: AnyView {
        AnyView(self)
    }
}
