//
//  LABColorTests.swift
//  chroma
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import XCTest
@testable import chroma

final class LABColorTests: XCTestCase {}

// Test for XYZColor
extension LABColorTests {
    func testToxXYZColor() {
        let xyzColor = LABColor(lightness: 50, a: 10, b: -5, alpha: 1).toXYZColor()
        XCTAssertEqual(xyzColor.x.floor(numberOfDigits: 4), 0.1941)
        XCTAssertEqual(xyzColor.y.floor(numberOfDigits: 4), 0.1841)
        XCTAssertEqual(xyzColor.z.floor(numberOfDigits: 4), 0.2281)
        XCTAssertEqual(xyzColor.alpha, 1)
    }
}
