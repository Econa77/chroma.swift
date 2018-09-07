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
        let noAlphaWhiteHex = Color.white.toHexString(isIncludeAlpha: false)
        XCTAssertEqual(whiteHex, "#ffffffff")
        XCTAssertEqual(noAlphaWhiteHex, "#ffffff")

        let yellowHex = Color(red: 255 / 255, green: 240 / 255, blue: 0 / 255, alpha: 1).toHexString()
        let noAlphaYellowHex = Color(red: 255 / 255, green: 240 / 255, blue: 0 / 255, alpha: 1).toHexString(isIncludeAlpha: false)
        XCTAssertEqual(yellowHex, "#fff000ff")
        XCTAssertEqual(noAlphaYellowHex, "#fff000")

        let clearHex = Color.clear.toHexString()
        let noAlphaClearHex = Color.clear.toHexString(isIncludeAlpha: false)
        XCTAssertEqual(clearHex, "#00000000")
        XCTAssertEqual(noAlphaClearHex, "#000000")
    }
}
