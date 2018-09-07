//
//  CGFloatExtensions.swift
//  chroma iOS
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import CoreGraphics

extension CGFloat {
    func clamp(min: CGFloat, max: CGFloat) -> CGFloat {
        return fmax(min, fmin(max, self))
    }
}
