//
//  Config+Display.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

import Foundation
import Combine

extension Config {
    
    struct Display {
        
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
        
        /// `Config` Initialization Method
        /// - Parameters:
        ///   - isHidden:       Hidden or display `Blink`, Hidden = true, display = false, `default` = `true`
        ///   - delay:          Delay Hidden `Blink`, `default` = `2s`
        ///   - isAutoHidden:   Automatically hidden, `default` = `true`
        ///   - isTapGesture:   Click `Blink` is hidden
        ///   - cancellable:    Time Tasks
        public init(isHidden: Bool, delay: TimeInterval, isAutoHidden: Bool, isTapGesture: Bool, cancellable: AnyCancellable?) {
            self.isHidden = isHidden
            self.delay = delay
            self.isAutoHidden = isAutoHidden
            self.isTapGesture = isTapGesture
            self.cancellable = cancellable
        }
    }
    
}
