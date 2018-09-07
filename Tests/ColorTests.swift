//
//  ColorTests.swift
//  chroma
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import XCTest
@testable import chroma

final class ColorTests: XCTestCase {}

// Test for Hex
extension ColorTests {
    func testHexString() {
        let whiteHex = Color.white.toHexString()
        XCTAssertEqual(whiteHex, "#ffffffff")

        let yellowHex = Color(red: 255 / 255, green: 240 / 255, blue: 0 / 255, alpha: 1).toHexString()
        XCTAssertEqual(yellowHex, "#fff000ff")

        let clearHex = Color.clear.toHexString()
        XCTAssertEqual(clearHex, "#00000000")

    }
}
