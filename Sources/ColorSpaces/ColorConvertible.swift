//
//  ColorConvertible.swift
//  chroma iOS
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation

public protocol ColorConvertible {
    func toRGBColor() -> RGBColor
    func toLABColor() -> LABColor
    func toXYZColor() -> XYZColor
    func toColor() -> Color
}
