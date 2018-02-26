//
//  UIDevice+extension.swift
//  App
//
//  Created by kila on 22/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//
// 本扩展部分代码引用自某网络资源 https://www.jianshu.com/p/5f8cdec48085

import UIKit

extension UIDevice {
    
    /*
     用法
     let modelName = UIDevice.current.modelName
     */
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        var name: String?
        switch identifier {
        case "iPod1,1":
            name = "iPod Touch 1"
        case "iPod2,1":
            name = "iPod Touch 2"
        case "iPod3,1":
            name = "iPod Touch 3"
        case "iPod4,1":
            name = "iPod Touch 4"
        case "iPod5,1":
            name = "iPod Touch (5 Gen)"
        case "iPod7,1":
            name = "iPod Touch 6"
            
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":
            name = "iPhone 4"
        case "iPhone4,1":
            name = "iPhone 4s"
        case "iPhone5,1":
            name = "iPhone 5"
        case  "iPhone5,2":
            name = "iPhone 5 (GSM+CDMA)"
        case "iPhone5,3":
            name = "iPhone 5c (GSM)"
        case "iPhone5,4":
            name = "iPhone 5c (GSM+CDMA)"
        case "iPhone6,1":
            name = "iPhone 5s (GSM)"
        case "iPhone6,2":
            name = "iPhone 5s (GSM+CDMA)"
        case "iPhone7,2":
            name = "iPhone 6"
        case "iPhone7,1":
            name = "iPhone 6 Plus"
        case "iPhone8,1":
            name = "iPhone 6s"
        case "iPhone8,2":
            name = "iPhone 6s Plus"
        case "iPhone8,4":
            name = "iPhone SE"
        case "iPhone9,1":
            name = "国行、日版、港行iPhone 7"
        case "iPhone9,2":
            name = "港行、国行iPhone 7 Plus"
        case "iPhone9,3":
            name = "美版、台版iPhone 7"
        case "iPhone9,4":
            name = "美版、台版iPhone 7 Plus"
        case "iPhone10,1","iPhone10,4":
            name = "iPhone 8"
        case "iPhone10,2","iPhone10,5":
            name = "iPhone 8 Plus"
        case "iPhone10,3","iPhone10,6":
            name = "iPhone X"
            
        case "iPad1,1":
            name = "iPad"
        case "iPad1,2":
            name = "iPad 3G"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            name = "iPad 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":
            name = "iPad Mini"
        case "iPad3,1", "iPad3,2", "iPad3,3":
            name = "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":
            name = "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":
            name = "iPad Air"
        case "iPad4,4", "iPad4,5", "iPad4,6":
            name = "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":
            name = "iPad Mini 3"
        case "iPad5,1", "iPad5,2":
            name = "iPad Mini 4"
        case "iPad5,3", "iPad5,4":
            name = "iPad Air 2"
        case "iPad6,3", "iPad6,4":
            name = "iPad Pro 9.7"
        case "iPad6,7", "iPad6,8":
            name = "iPad Pro 12.9"
        case "AppleTV2,1":
            name = "Apple TV 2"
        case "AppleTV3,1","AppleTV3,2":
            name = "Apple TV 3"
        case "AppleTV5,3":
            name = "Apple TV 4"
        case "i386", "x86_64":
            // 这里仅限于iPhone，其他的设备可以自行扩展
            let screenWidth = UIScreen.main.bounds.size.width
            let screenHeight = UIScreen.main.bounds.size.height
//            print(screenWidth)
//            print(screenHeight)
            if 375 == screenWidth && 812 == screenHeight {
                name = "iPhone X"
            }
            else {
                name = "Simulator"
            }
            
        default:
            name = identifier
        }
        return name!
    }
}
