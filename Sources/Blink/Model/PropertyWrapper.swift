//
//  PropertyWrapper.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//

@propertyWrapper
public struct DefaultValue<T: Comparable & Sendable>: Sendable {

    public let defaultValue: T
    
    private var value: T
    
    public var wrappedValue: T {
        get { value }
        set { value = max(defaultValue, newValue) }
    }

    public init(defaultValue: T, value: T) {
        self.defaultValue = defaultValue
        self.value = max(value, defaultValue)
    }
    
}
