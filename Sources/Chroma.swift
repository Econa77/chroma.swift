//
//  Chroma.swift
//  chroma
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation

public final class Chroma {}

// MARK: - Scale
extension Chroma {
    public func scale(_ colors: [ColorConvertible], colorSpace: ColorSpace = .lab) -> Scale {
        return Scale(colors: colors, colorSpace: colorSpace)
    }
}
