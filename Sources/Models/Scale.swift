//
//  Scale.swift
//  chroma
//
//  Created by 古林　俊祐　 on 2018/09/07.
//  Copyright © 2018年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation
import CoreGraphics

public final class Scale {

    // MARK: - Properties
    public let colors: [ColorConvertible]
    public let colorSpace: ColorSpace

    // MARK: - Initialize
    init(colors: [ColorConvertible], colorSpace: ColorSpace) {
        self.colors = colors
        self.colorSpace = colorSpace
    }

}

// MARK: - Colors
extension Scale {
    public func split(_ count: Int) -> [Color] {
        return []
    }

    public func color(_ position: CGFloat) -> Color {
        return Color.white
    }
}
