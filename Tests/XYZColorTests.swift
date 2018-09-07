//
//  XYZColorTests.swift
//  chroma
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import XCTest
@testable import chroma

final class XYZColorTests: XCTestCase {}

// Test for RGBColor
extension XYZColorTests {
    func testToRGBColor() {
        let rgbColor = XYZColor(x: 0.25, y: 0.40, z: 0.10, alpha: 1).toRGBColor()
        XCTAssertEqual(rgbColor.red.floor(numberOfDigits: 4), 0.4174)
        XCTAssertEqual(rgbColor.green.floor(numberOfDigits: 4), 0.7433)
        XCTAssertEqual(rgbColor.blue.floor(numberOfDigits: 4), 0.2151)
        XCTAssertEqual(rgbColor.alpha, 1)
    }
}

// Test for LABColor
extension XYZColorTests {
    func testToLABColor() {
        let labColor = XYZColor(x: 0.25, y: 0.40, z: 0.1, alpha: 1).toLABColor()
        XCTAssertEqual(labColor.lightness.floor(numberOfDigits: 4), 68.4695)
        XCTAssertEqual(labColor.a.floor(numberOfDigits: 4), -48.044)
        XCTAssertEqual(labColor.b.floor(numberOfDigits: 4), 57.1259)
        XCTAssertEqual(labColor.alpha, 1)
    }
}
