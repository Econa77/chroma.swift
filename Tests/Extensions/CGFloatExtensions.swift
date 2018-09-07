//
//  CGFloatExtensions.swift
//  chroma
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import CoreGraphics

extension CGFloat {
    func floor(numberOfDigits: Int) -> CGFloat {
        let number = CGFloat(pow(10.0, Double(numberOfDigits)))
        let floatValue = Float(self * number)
        return CGFloat(floorf(floatValue)) / number
    }
}
