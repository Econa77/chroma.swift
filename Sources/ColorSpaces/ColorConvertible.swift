//
//  ColorConvertible.swift
//  chroma iOS
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import CoreGraphics

public protocol ColorConvertible {
    var alpha: CGFloat { get }

    func toRGBColor() -> RGBColor
    func toLABColor() -> LABColor
    func toXYZColor() -> XYZColor
    func toColor() -> Color
}
