//
//  BlinkDefaultValue.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

// MARK: - BlinkDefaultValue
/// Blink Property Wrapper, Set Default Value
@propertyWrapper
public struct BlinkDefaultValue<Element: Comparable & Sendable>: Sendable {

    /// default value
    public let defaultValue: Element

    /// value
    private var value: Element

    
    public var wrappedValue: Element {
        get { value }
        set { value = max(defaultValue, newValue) }
    }

    public init(defaultValue: Element, value: Element) {
        self.defaultValue = defaultValue
        self.value = max(value, defaultValue)
    }
}
// MARK: -
