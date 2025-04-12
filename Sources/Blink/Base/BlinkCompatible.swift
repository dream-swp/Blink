//
//  BlinkCompatible.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import SwiftUI

// MARK: - BlinkCompatible
/// Data isolation protocol
public protocol BlinkCompatible {}

/// Item
public struct BK<Item> {

    /// Prefix property
    public let bk: Item

    /// Initialization method
    /// - Parameter bk: Item
    public init(_ ds: Item) {
        self.bk = ds
    }
}

extension BlinkCompatible {

    /// Instance property
    public var bk: BK<Self> {
        set {}
        get { BK(self) }
    }

    /// Static property
    public static var bk: BK<Self>.Type {
        set {}
        get { BK<Self>.self }
    }
}

// MARK: - Image: BlinkCompatible
extension Image: BlinkCompatible {}
// MARK: - String: BlinkCompatible
extension String: BlinkCompatible {}
// MARK: - Blink: BlinkCompatible
extension Blink: BlinkCompatible {}
// MARK: - Color: BlinkCompatible
extension Color: BlinkCompatible {}
// MARK: -
