//
//  Config.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Foundation
import SwiftUI

public protocol ConfigProperty: AnyObject {
    var data: Config.Data { get set }

    var style: Config.Style { get set }

    var display: Config.Display { get set }
}

extension ConfigProperty {

    public var data: (_: () -> Config.Data) -> Self {
        return {
            self.data = $0()
            return self
        }
    }

    public var style: (_: () -> Config.Style) -> Self {
        return {
            self.style = $0()
            return self
        }
    }

    public var display: (_: () -> Config.Display) -> Self {
        return {
            self.display = $0()
            return self
        }
    }
}

public class Config: ObservableObject, ConfigProperty, @unchecked Sendable {

    @Published public var data: Data

    @Published public var style: Style = .default

    @Published public var display: Display = .default
    
    @Published public var blur: Blur?

    public init(data: Data) {
        self.data = data
        self.style = style
    }

    public convenience init(title: String, message: String) {
        let data = Data(title: title, message: message)
        self.init(data: data)
    }
}
