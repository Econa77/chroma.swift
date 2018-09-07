//
//  LABColor.swift
//  chroma iOS
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import CoreGraphics

public struct LABColor {

    // MARK: - Properties
    public let lightness: CGFloat
    public let a: CGFloat
    public let b: CGFloat
    public let alpha: CGFloat

    // MARK: - Initialize
    public init(lightness: CGFloat, a: CGFloat, b: CGFloat, alpha: CGFloat) {
        self.lightness = lightness.clamp(min: 0, max: 100)
        self.a = a.clamp(min: -128, max: 128)
        self.b = b.clamp(min: -128, max: 128)
        self.alpha = alpha.clamp(min: 0, max: 1)
    }

}

// MARK: - Color Convertible
extension LABColor: ColorConvertible {
    public func toRGBColor() -> RGBColor {
        return toXYZColor().toRGBColor()
    }

    public func toLABColor() -> LABColor {
        return self
    }

    public func toXYZColor() -> XYZColor {
        let fy = (lightness + 16) / 116
        let fx = fy + (a / 500)
        let fz = fy - (b / 200)
        let x = deltaXYZ(fx) * 0.95047
        let y = deltaXYZ(fy) * 1
        let z = deltaXYZ(fz) * 1.08883
        return XYZColor(x: x, y: y, z: z, alpha: 1)
    }

    private func deltaXYZ(_ value: CGFloat) -> CGFloat {
        let pow = value * value * value
        return (pow > 0.008856) ? pow : ((value - 0.1379310) / 7.787036)
    }

    public func toColor() -> Color {
        return toRGBColor().toColor()
    }
}
