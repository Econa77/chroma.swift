//
//  Scale.swift
//  chroma
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation
import CoreGraphics

public final class Scale {

    // MARK: - Properties
    public let colors: [ColorConvertible]
    public let colorSpace: ColorSpace
    private let positions: [CGFloat]

    // MARK: - Initialize
    init(colors: [ColorConvertible], colorSpace: ColorSpace) {
        self.colorSpace = colorSpace
        self.colors = colors
        self.positions = colors.enumerated().map { CGFloat($0.offset) / CGFloat(colors.count - 1) }
    }
}

// MARK: - Colors
extension Scale {
    public func split(_ count: Int) -> [Color] {
        guard !colors.isEmpty else { return [] } 
        guard count > 0 else {
            guard let firstColor = colors.first?.toColor() else { return [] }
            return [firstColor]
        }
        guard count != 1 else {
            return [color(0.5)].compactMap { $0 }
        }
        let minDomain: CGFloat = 0
        let maxDomain: CGFloat = 1
        return (0..<count).compactMap { color(minDomain + (CGFloat($0) / CGFloat(count - 1)) * maxDomain) }
    }

    public func color(_ position: CGFloat) -> Color? {
        var t: CGFloat = position
        for i in 0..<positions.count {
            let p = positions[i]
            if t <= p {
                return colors[i].toColor()
            }
            if t >= p && i == positions.count - 1 {
                return colors[i].toColor()
            }
            if t > p && t < positions[i + 1] {
                t = (t - p) / (positions[i + 1] - p)
                let color1 = colors[i]
                let color2 = colors[i + 1]
                return interpolate(color1: color1, color2: color2, position: t)
            }
        }
        return nil
    }

    private func interpolate(color1: ColorConvertible, color2: ColorConvertible, position: CGFloat) -> Color {
        switch colorSpace {
        case .rgb:
            let rgbColor1 = color1.toRGBColor()
            let rgbColor2 = color2.toRGBColor()
            return RGBColor(red: rgbColor1.red + position * (rgbColor2.red - rgbColor1.red),
                            green: rgbColor1.green + position * (rgbColor2.green - rgbColor1.green),
                            blue: rgbColor1.blue + position * (rgbColor2.blue - rgbColor1.blue),
                            alpha: rgbColor1.alpha + position * (rgbColor2.alpha - rgbColor1.alpha)).toColor()
        case .lab:
            let labColor1 = color1.toLABColor()
            let labColor2 = color2.toLABColor()
            return LABColor(lightness: labColor1.lightness + position * (labColor2.lightness - labColor1.lightness),
                            a: labColor1.a + position * (labColor2.a - labColor1.a),
                            b: labColor1.b + position * (labColor2.b - labColor1.b),
                            alpha: labColor1.alpha + position * (labColor2.alpha - labColor1.alpha)).toColor()

        }
    }
}
