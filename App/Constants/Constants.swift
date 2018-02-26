//
//  Constants.swift
//  App
//
//  Created by kila on 11/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

struct Constants {
    
    // 配置
    struct Configs {
        static let DEVICE = 2 // 设备类型（1=安卓，2=苹果）
        static let VERSION = "1.0.9" // 客户端版本
        static let CHANNEL = "guanwang" // 客户端渠道
        // 接口配置
        // 正式用
        static let API_IP = "106.14.132.45"
        // 测试用
        //    static let API_IP = "192.168.1.114"
        
        static let API_PORT = "80"
        static let API_VERSION = "v1"
        static let API_SITE = "http://" + API_IP + ":" + API_PORT + "/app/k_english/apis/" + API_VERSION + "/api/"
        static let API_KEY = "Px"
        static let API_RSA_PUCLIC_KEY = ""
    }
    
    // 颜色
    struct Colors {
        // 主题色系
        static let COLOR_PRIMARY = 0x4B66EA
        static let COLOR_PRIMARY_LIGHT = 0x3F67E6
        static let COLOR_PRIMARY_DARK = 0x4B66EA
        static let COLOR_PRIMARY_WHITE = 0xFFFFFF
        // 主题字体色系
        static let COLOR_TXT_PRIMARY_WHITE = 0xFFFFFF
        static let COLOR_TXT_PRIMARY_LIGHT = 0x969696
        static let COLOR_TXT_PRIMARY_MEDIUM = 0x696969
        static let COLOR_TXT_PRIMARY_DARK = 0x131313
        static let COLOR_TXT_PRIMARY_Dark_B = 0x3F67E6
        // 通用字体色系-tab
        static let COLOR_TXT_TAB_NORMAL = 0x969696
        static let COLOR_TXT_TAB_FOCUSED = 0xffffff
    }
    
    // 其他
    
    struct Device {
        static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    }
}
