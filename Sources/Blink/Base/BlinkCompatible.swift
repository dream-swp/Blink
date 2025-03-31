//
//  BlinkCompatible.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import SwiftUI


/// Data isolation protocol
public protocol BlinkCompatible { }

/// Item
public struct BK<Item> {
    
    /// Prefix property
    public let bk: Item
    
    /// Initialization method
    /// - Parameter bk: Item
    public init(_ ds : Item) {
        self.bk = ds
    }
}

public extension BlinkCompatible {
    
    /// Instance property
    var bk: BK<Self> {
        set { }
        get { BK(self) }
    }
    
    /// Static property
    static var bk: BK<Self>.Type {
        set { }
        get { BK<Self>.self }
    }
}


extension Image: BlinkCompatible { }

