//
//  DarkenTests.swift
//  chroma iOSTests
//
//  Created by 古林　俊祐　 on 2018/09/15.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import XCTest
@testable import chroma

final class DarkenTests: XCTestCase {}

// Test for Darken
extension DarkenTests {
    func testDarken() {
        let color = Color(red: 1, green: 0, blue: 0, alpha: 1)
        XCTAssertEqual(color.darken().toHexString(isIncludeAlpha: false), "#be0000") // #c20000
        XCTAssertEqual(color.darken(2).toHexString(isIncludeAlpha: false), "#820000") // #890000
        XCTAssertEqual(color.darken(10).toHexString(isIncludeAlpha: false), "#500004") // #000000
    }
}

// Test for Brighten
extension DarkenTests {
    func testBrighen() {
        let color = Color(red: 1, green: 0, blue: 0, alpha: 1)
        XCTAssertEqual(color.brighten().toHexString(isIncludeAlpha: false), "#ff5632") // #ff5a36
        XCTAssertEqual(color.brighten(10).toHexString(isIncludeAlpha: false), "#fffb77") // #ffffff
    }
}
