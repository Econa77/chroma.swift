//
//  ScaleTests.swift
//  chroma
//
//  Created by 古林　俊祐　 on 2018/09/10.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import XCTest
@testable import chroma

final class ScaleTests: XCTestCase {}

// Test for split
extension ScaleTests {
    func testSplitColorsCount() {
        let noColorScale = Scale(colors: [], colorSpace: .lab)
        XCTAssertEqual(noColorScale.split(-1).count, 0)
        XCTAssertEqual(noColorScale.split(0).count, 0)
        XCTAssertEqual(noColorScale.split(1).count, 0)
        XCTAssertEqual(noColorScale.split(5).count, 0)

        let scale = Scale(colors: [Color.white, Color.black], colorSpace: .lab)
        XCTAssertEqual(scale.split(-1).count, 1)
        XCTAssertEqual(scale.split(0).count, 1)
        XCTAssertEqual(scale.split(1).count, 1)
        XCTAssertEqual(scale.split(5).count, 5)
    }
}

// Test for color
extension ScaleTests {
    func testColor() {
        let scale = Scale(colors: [Color.white, Color.black], colorSpace: .rgb)
        XCTAssertEqual(scale.color(0)?.toHexString(isIncludeAlpha: false), "#ffffff")
        XCTAssertEqual(scale.color(0.25)?.toHexString(isIncludeAlpha: false), "#bfbfbf")
        XCTAssertEqual(scale.color(0.5)?.toHexString(isIncludeAlpha: false), "#7f7f7f")
        XCTAssertEqual(scale.color(0.75)?.toHexString(isIncludeAlpha: false), "#3f3f3f")
        XCTAssertEqual(scale.color(1)?.toHexString(isIncludeAlpha: false), "#000000")
    }
}
