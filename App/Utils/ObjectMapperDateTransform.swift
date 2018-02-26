//
//  HxDateTransform.swift
//  App
//
//  Created by kila on 17/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import ObjectMapper

// 自定义ObjectMapper的时间转换（实现协议TransformType）
class ObjectMapperDateTransform: TransformType {
    public typealias Object = Date
    public typealias JSON = String
    
    public init() {}
    
    open func transformFromJSON(_ value: Any?) -> Date? {
        if let timeStr = value as? String {
            return DateUtil.str2Date(str: timeStr, format: DateUtil.DateFormat.FORMAT_YMDHMS.rawValue)
        }
        return nil
    }
    
    open func transformToJSON(_ value: Date?) -> String? {
        if let date = value {
            return DateUtil.date2Str(date: date, format: DateUtil.DateFormat.FORMAT_YMDHMS.rawValue)
        }
        return nil
    }
}

