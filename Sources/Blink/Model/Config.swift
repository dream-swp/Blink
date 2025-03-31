//
//  Config.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Foundation
import SwiftUI

public class Config: ObservableObject, @unchecked Sendable {

     @Published public var data: Data

    /// `Blink` Initialization Method
    /// - Parameters:
    ///   - title:          Tips title
    ///   - message:        Tips message
    public convenience init(title: String, message: String) {
        let data = Data(title: title, message: message)
        self.init(data)
    }
    
    
    /// `Blink` Initialization Method
    /// - Parameter data: Drive the `Blink` data model
    public init(_ data: Data) {
        self.data = data
    }
    
    
}
