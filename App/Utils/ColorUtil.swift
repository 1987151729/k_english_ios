//
//  ColorUtil.swift
//  App
//
//  Created by kila on 18/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class ColorUtil: NSObject {
    
    // 通过16进制颜色获取RGB颜色
    static func rgbColorFromHex(hex: Int, alpha: CGFloat) -> (UIColor) {
        return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0,
                       green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0,
                       blue: ((CGFloat)(hex & 0xFF)) / 255.0,
                       alpha: alpha)
    }
}
