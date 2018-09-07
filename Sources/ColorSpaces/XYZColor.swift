//
//  XYZColor.swift
//  chroma iOS
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import CoreGraphics

public struct XYZColor {

    // MARK: - Properties
    public let x: CGFloat
    public let y: CGFloat
    public let z: CGFloat
    public let alpha: CGFloat

    // MARK: - Initialize
    public init(x: CGFloat, y: CGFloat, z: CGFloat, alpha: CGFloat) {
        self.x = x.clamp(min: 0, max: 0.95047)
        self.y = y.clamp(min: 0, max: 1)
        self.z = z.clamp(min: 0, max: 1.08883)
        self.alpha = alpha.clamp(min: 0, max: 1)
    }

}

// MARK: - Color Convertible
extension XYZColor: ColorConvertible {
    public func toRGBColor() -> RGBColor {
        let r = (x *  3.2404542) + (y * -1.5371385) + (z * -0.4985314)
        let g = (x * -0.9692660) + (y *  1.8760108) + (z *  0.0415560)
        let b = (x *  0.0556434) + (y * -0.2040259) + (z *  1.0572252)
        let red = deltaRGB(r)
        let green = deltaRGB(g)
        let blue = deltaRGB(b)
        return RGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    private func deltaRGB(_ value: CGFloat) -> CGFloat {
        return (value > 0.0031308) ? (1.055 * pow(value, 1 / 2.4) - 0.055) : (12.92 * value)
    }

    public func toLABColor() -> LABColor {
        let fx = deltaLAB(x / 0.95047)
        let fy = deltaLAB(y / 1)
        let fz = deltaLAB(z / 1.08883)
        let lightness = 116 * fy - 17
        let a = 500 * (fx - fy)
        let b = 200 * (fy - fz)
        return LABColor(lightness: lightness, a: a, b: b, alpha: alpha)
    }

    private func deltaLAB(_ value: CGFloat) -> CGFloat {
        return (value > 0.008856) ? pow(value, 1 / 3) : ((7.787036 * value) + 0.1379310)
    }

    public func toXYZColor() -> XYZColor {
        return self
    }

    public func toColor() -> Color {
        return toRGBColor().toColor()
    }
}
