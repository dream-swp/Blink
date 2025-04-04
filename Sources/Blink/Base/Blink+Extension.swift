//
//  Blink+Extension.swift
//  Blink
//
//  Created by Dream on 2025/3/30.
//

import Combine
import SwiftUI

extension BK where Item == Image {
    public static var `default`: Image {
        Image(systemName: String.bk.defaultImageSystemName)
    }
}

extension BK where Item == String {
    public static var defaultImageSystemName: String { "checkmark.circle" }
}

extension View {

    public var eraseToAnyView: AnyView {
        AnyView(self)
    }
}

extension BK where Item == Blink {
    
    /// Delayed implementation of tasks
    /// - Parameters:
    ///   - time:   Time Delay
    ///   - task:   Delayed tasks
    /// - Returns:  Cancellable tasks
    @discardableResult
    public func delay(_ time: TimeInterval, task: @escaping () -> Void) -> AnyCancellable {
        Timer.publish(every: time, tolerance: 0.5, on: .main, in: .common)
            .autoconnect()
            .sink { _ in task() }
    }
    
    /// Delayed implementation of tasks
    /// - Parameters:
    ///   - time:   Time Delay
    ///   - task:   Delayed tasks
    /// - Returns:  Cancellable tasks
    @discardableResult
    public static func delay(_ time: TimeInterval, task: @escaping () -> Void) -> AnyCancellable {
        Timer.publish(every: time, tolerance: 0.5, on: .main, in: .common)
            .autoconnect()
            .sink { _ in task() }
    }

    /// `Blink` animation display
    /// - Parameter config: `Config
    public static func display(_ config: Config) {
        withAnimation { config.display.isHidden = false }
    }

    public static var display: (_: () -> Config) -> Void {
        return { result in
            withAnimation { result().display.isHidden = false }
        }
    }

    public static var hidden: (_: () -> Config) -> Void {
        return { result in
            withAnimation { result().display.isHidden = true }
        }
    }

    public var display: (_: () -> Config) -> Void {
        return { result in
            withAnimation { result().display.isHidden = false }
        }
    }

    public var hidden: (_: () -> Config) -> Void {
        return { result in
            withAnimation { result().display.isHidden = true }
        }
    }
}

extension BK where Item == Blink {

    var isDelayHidden: (_: @escaping () -> (config: Config, isDelay: Bool)) -> AnyCancellable? {

        return { result in
            if result().isDelay {
                return self.delay(result().config.display.delay) {
                    withAnimation { result().config.display.isHidden = true }
                }
            }
            return nil
        }
    }
}
