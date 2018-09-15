//
//  Darken.swift
//  chroma iOS
//
//  Created by 古林　俊祐　 on 2018/09/15.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import CoreGraphics

/**
 *  ref: https://github.com/gka/chroma.js/blob/6d6622aebd924f9480e6e49113a02d254162a8bf/src/ops/darken.coffee
 **/
extension ColorConvertible {
    public func darken(_ amount: Int = 1) -> Color {
        let labColor = toLABColor()
        let lightness = labColor.lightness - 18 * CGFloat(amount)
        return LABColor(lightness: lightness, a: labColor.a, b: labColor.b, alpha: labColor.alpha).toColor()
    }

    public func brighten(_ amount: Int = 1) -> Color {
        return darken(-amount)
    }
}
