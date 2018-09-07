//
//  ColorExtensions.swift
//  chroma
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation

#if canImport(UIKit)
import UIKit
public typealias Color = UIColor

extension UIColor {
    func getColors(_ red: UnsafeMutablePointer<CGFloat>?,
                   green: UnsafeMutablePointer<CGFloat>?,
                   blue: UnsafeMutablePointer<CGFloat>?,
                   alpha: UnsafeMutablePointer<CGFloat>?) {
        getRed(red, green: green, blue: blue, alpha: alpha)
    }
}

#elseif canImport(AppKit)
import AppKit
public typealias Color = NSColor

extension NSColor {
    func getColors(_ red: UnsafeMutablePointer<CGFloat>?,
                   green: UnsafeMutablePointer<CGFloat>?,
                   blue: UnsafeMutablePointer<CGFloat>?,
                   alpha: UnsafeMutablePointer<CGFloat>?) {
        guard let color = usingColorSpace(.sRGB) else { return }
        color.getRed(red, green: green, blue: blue, alpha: alpha)
    }
}
#endif

extension Color: ColorConvertible {
    public func toRGBColor() -> RGBColor {
        var red = CGFloat(0)
        var green = CGFloat(0)
        var blue = CGFloat(0)
        var alpha = CGFloat(0)
        getColors(&red, green: &green, blue: &blue, alpha: &alpha)
        return RGBColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    public func toLABColor() -> LABColor {
        return toRGBColor().toLABColor()
    }

    public func toXYZColor() -> XYZColor {
        return toRGBColor().toXYZColor()
    }

    public func toColor() -> Color {
        return self
    }
}
