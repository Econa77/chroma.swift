//
//  RGBColorTests.swift
//  chroma iOSTests
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import XCTest
@testable import chroma

final class RGBColorTests: XCTestCase {}

// Test for XYZColor
extension RGBColorTests {
    func testToXYZColor() {
        let xyzColor = RGBColor(red: 1, green: 1, blue: 1, alpha: 1).toXYZColor()
        XCTAssertEqual(xyzColor.x.floor(numberOfDigits: 4), 0.9504)
        XCTAssertEqual(xyzColor.y.floor(numberOfDigits: 4), 1.0000)
        XCTAssertEqual(xyzColor.z.floor(numberOfDigits: 4), 1.0888)
        XCTAssertEqual(xyzColor.alpha, 1)
    }
}
