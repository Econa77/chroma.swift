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

// MARK: - Hex
extension Color {
    public func toHexString(isIncludeAlpha: Bool = true) -> String {
        let rgbColor = toRGBColor()
        let red = Int(rgbColor.red * 255)
        let green = Int(rgbColor.green * 255)
        let blue = Int(rgbColor.blue * 255)
        let alpha = Int(rgbColor.alpha * 255)
        let redHexString = "\(String(format: "%02x", red))"
        let greenHexString = "\(String(format: "%02x", green))"
        let blueHexString = "\(String(format: "%02x", blue))"
        let alphaHexString = (isIncludeAlpha) ? "\(String(format: "%02x", alpha))" : ""
        return "#\(redHexString)\(greenHexString)\(blueHexString)\(alphaHexString)"
    }
}

// MARK: - Color Convertible
extension Color: ColorConvertible {
    public var alpha: CGFloat {
        return toRGBColor().alpha
    }

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

// MARK: - CGColor
extension Collection where Element: Color {
    public var cgColors: [CGColor] {
        return map { $0.cgColor }
    }
}
