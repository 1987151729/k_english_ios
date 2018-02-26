//
//  DateUtil.swift
//  App
//
//  Created by kila on 17/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

// 日期格式化工具类
class DateUtil: NSObject {
    
    enum DateFormat: String {
        /**
         * 英文简写如：2010
         */
        case FORMAT_Y = "yyyy"
        
        /**
         * 英文简写如：12:01
         */
        case FORMAT_HM = "HH:mm"
        
        /**
         * 英文简写如：1-12 12:01
         */
        case FORMAT_MDHM = "MM-dd HH:mm"
        
        /**
         * 英文简写（默认）如：2010-12-01
         */
        case FORMAT_YMD = "yyyy-MM-dd"
        
        /**
         * 英文全称  如：2010-12-01 23:15
         */
        case FORMAT_YMDHM = "yyyy-MM-dd HH:mm"
        
        /**
         * 英文全称  如：2010/12/01 23:15
         */
        case FORMAT_YMDHM_1 = "yyyy/MM/dd HH:mm"
        
        /**
         * 英文全称  如：2010-12-01 23:15:06
         */
        case FORMAT_YMDHMS = "yyyy-MM-dd HH:mm:ss"
        
        /**
         * 精确到毫秒的完整时间    如：yyyy-MM-dd HH:mm:ss.S
         */
        case FORMAT_FULL = "yyyy-MM-dd HH:mm:ss.S"
        
        /**
         * 精确到毫秒的完整时间    如：yyyy-MM-dd HH:mm:ss.S
         */
        case FORMAT_FULL_SN = "yyyyMMddHHmmssS"
        
        /**
         * 中文简写  如：2010年12月01日
         */
        case FORMAT_YMD_CN = "yyyy年MM月dd日"
        
        /**
         * 中文简写  如：2010年12月01日  12时
         */
        case FORMAT_YMDH_CN = "yyyy年MM月dd日 HH时"
        
        /**
         * 中文简写  如：2010年12月01日  12时12分
         */
        case FORMAT_YMDHM_CN = "yyyy年MM月dd日 HH时mm分"
        
        /**
         * 2010年12月01日  12:12
         */
        case FORMAT_YMDHM_CN_EN = "yyyy年MM月dd日 HH:mm"
        
        /**
         * 中文全称  如：2010年12月01日  23时15分06秒
         */
        case FORMAT_YMDHMS_CN = "yyyy年MM月dd日 HH时mm分ss秒"
        
        /**
         * 精确到毫秒的完整中文时间
         */
        case FORMAT_FULL_CN = "yyyy年MM月dd日 HH时mm分ss秒SSS毫秒"
    }
    
    static func str2Date(str: String, format: String) -> Date {
        var format_: String?
        if (format.isEmpty) {
            format_ = DateFormat.FORMAT_YMDHMS.rawValue
        }
        else{
            format_ = format
        }
        let formatter = DateFormatter()
        formatter.dateFormat = format_
        let date = formatter.date(from: str)
        return date!;
    }
    
    static func date2Str(date: Date, format: String) -> String {
        var format_: String?
        if (format.isEmpty) {
            format_ = DateFormat.FORMAT_YMDHMS.rawValue
        }
        else{
            format_ = format
        }
        let formatter = DateFormatter()
        formatter.dateFormat = format_
        let str = formatter.string(from: date)
        return str
    }
    
    // 获取时间描述（以现在的时间为基准）
    static func timeBetween(date: Date) -> String {
        let now: Date = NSDate() as Date
        let gregorian = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        let result = gregorian!.components(NSCalendar.Unit.second, from: date, to: now, options: NSCalendar.Options(rawValue: 0)) // 获取时间差--秒
        let between = result.second!
        let year = between / 3600 / 24 / 60
        let day = between / 3600 / 24
        let hours = between % (24 * 3600) / 3600
        let minute = between % 3600 / 60
        
        if (year != 0) {
            return date2Str(date: date, format: DateFormat.FORMAT_YMD_CN.rawValue)
        } else if (day != 0) {
            return String(day) + "天前"
        } else if (hours != 0) {
            return String(hours) + "小时前"
        } else if (minute != 0) {
            return String(minute) + "分钟前"
        } else {
            if (60 >= between) {
                return "刚刚"
            } else {
                return date2Str(date: date, format: DateFormat.FORMAT_YMD_CN.rawValue)
            }
        }
    }
}
