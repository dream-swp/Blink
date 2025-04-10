//
//  Blink+Extension.swift
//  Blink
//
//  Created by Dream on 2025/3/30.
//

import Combine
import SwiftUI

// MARK: - Image: Extension
extension BK where Item == Image {

    /// default display Image
    public static var `default`: Image {
        Image(systemName: String.bk.defaultImageSystemName)
    }
}

// MARK: - String: Extension
extension BK where Item == String {

    /// default display Image name
    public static var defaultImageSystemName: String { "checkmark.circle" }
}

// MARK: - View: Extension
extension View {

    /// Convert to AnyView
    public var eraseToAnyView: AnyView {
        AnyView(self)
    }
}

// MARK: - Blink: Extension
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

    /// `Blink` animation display
    public static var display: (_: () -> Config) -> Void {
        return { result in
            withAnimation { result().display.isHidden = false }
        }
    }

    /// `Blink` animation hidden
    public static var hidden: (_: () -> Config) -> Void {
        return { result in
            withAnimation { result().display.isHidden = true }
        }
    }

    /// `Blink` animation display
    public var display: (_: () -> Config) -> Void {
        return { result in
            withAnimation { result().display.isHidden = false }
        }
    }

    /// `Blink` animation hidden
    public var hidden: (_: () -> Config) -> Void {
        return { result in
            withAnimation { result().display.isHidden = true }
        }
    }
}

// MARK: - Blink: Extension, internal
extension BK where Item == Blink {

    /// `Blink` animation isDelayHidden
    var isDelayHidden: (_: @escaping () -> (config: Config, isDelay: Bool)) -> AnyCancellable? {
        return { result in
            if result().isDelay {
                return self.delay(result().config.display.delay) {
                    withAnimation { result().config.display.isHidden = true }
                }
            }
            withAnimation { result().config.display.isHidden = true }
            return nil
        }
    }
}

extension BK where Item == Color {
    
    public static var blinkTitle: Color {
        Color(.blinkTitle)
    }
    
    public static var blinkDetails: Color {
        Color(.blinkDetails)
    }
    
    public static var blurBackground: Color {
        Color(.blurBackground)
    }
    
    public static var blinkBackground: Color {
        Color(.blinkBackground)
    }
    
    
}

// MARK: -
