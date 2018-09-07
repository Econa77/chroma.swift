//
//  RGBColor.swift
//  chroma iOS
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import CoreGraphics

public struct RGBColor {

    // MARK: - Properties
    public let red: CGFloat
    public let green: CGFloat
    public let blue: CGFloat
    public let alpha: CGFloat

    // MARK: - Initialize
    public init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.red = red.clamp(min: 0, max: 1)
        self.green = green.clamp(min: 0, max: 1)
        self.blue = blue.clamp(min: 0, max: 1)
        self.alpha = alpha.clamp(min: 0, max: 1)
    }

}

// MARK: - Color Convertible
extension RGBColor: ColorConvertible {
    public func toRGBColor() -> RGBColor {
        return self
    }

    public func toLABColor() -> LABColor {
        return toXYZColor().toLABColor()
    }

    public func toXYZColor() -> XYZColor {
        let r = deltaXYZ(red)
        let g = deltaXYZ(green)
        let b = deltaXYZ(blue)
        let x = (r * 0.4124564) + (g * 0.3575761) + (b * 0.1804375)
        let y = (r * 0.2126729) + (g * 0.7151522) + (b * 0.0721750)
        let z = (r * 0.0193339) + (g * 0.1191920) + (b * 0.9503041)
        return XYZColor(x: x, y: y, z: z, alpha: alpha)
    }

    private func deltaXYZ(_ value: CGFloat) -> CGFloat {
        return (value > 0.04045) ? pow((value + 0.055) / 1.055, 2.40) : (value / 12.92)
    }

    public func toColor() -> Color {
        return Color(red: red, green: green, blue: blue, alpha: alpha)
    }
}
