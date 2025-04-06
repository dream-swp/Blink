//
//  BlinkTestsDefaultValue.swift
//  Blink
//
//  Created by Dream on 2025/3/29.
//


import XCTest

@testable import Blink
import SwiftUI

final class BlinkTestsDefaultValue: BlinkTests {
    
    @BlinkDefaultValue<Double>(defaultValue: 0.6, value: 0)
    private var result
    
    
    func test_DefaultValue1() {
        
        // Given, When
        result = 0
        
        // Then
        XCTAssertTrue(result == 0.6)
    }
    
    
    func test_DefaultValue2() {
        
        // Given, When
        result = 1
        
        // Then
        XCTAssertTrue(result == 1)
    }
}
