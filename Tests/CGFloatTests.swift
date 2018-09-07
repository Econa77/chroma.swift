//
//  CGFloatTests.swift
//  chroma iOSTests
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import XCTest
@testable import chroma

final class CGFloatTests: XCTestCase {}

// Test for clamp
extension CGFloatTests {
    func testClamp() {
        XCTAssertEqual(CGFloat(128).clamp(min: 0, max: 100), 100)
        XCTAssertEqual(CGFloat(50).clamp(min: 0, max: 100), 50)
        XCTAssertEqual(CGFloat(-12).clamp(min: 0, max: 100), 0)
    }
}
