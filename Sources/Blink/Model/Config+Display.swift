//
//  Config+Display.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Combine
import Foundation

// MARK: - Config.Display
/// `Blink` Display data model
public struct Display: @unchecked Sendable {

    /// Hidden or display `Blink`, Hidden = true, display = false, `default` = `true`
    public var isHidden: Bool = true

    /// Delay Hidden `Blink`, `default` = `2s`
    public var delay: TimeInterval = 2

    /// Automatically hidden, `default` = `true`
    public var isAutoHidden: Bool = true

    /// Click `Blink` is hidden
    public var isTapGesture: Bool = true

    /// Time Tasks
    public var cancellable: AnyCancellable?

    /// Rapid Initialization
    public static let `default`: Display = .init()
    
    /// Initialization Display
    /// - Parameters:
    ///   - isHidden:       isHidden
    ///   - delay:          delay
    ///   - isAutoHidden:   isAutoHidden
    ///   - isTapGesture:   isTapGesture
    ///   - cancellable:    cancellable
    public init(isHidden: Bool = true, delay: TimeInterval = 2, isAutoHidden: Bool = true, isTapGesture: Bool = true, cancellable: AnyCancellable? = nil) {
        self.isHidden = isHidden
        self.delay = delay
        self.isAutoHidden = isAutoHidden
        self.isTapGesture = isTapGesture
        self.cancellable = cancellable
    }

}
// MARK: -
