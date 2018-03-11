//
//  TranslateRecordService.swift
//  App
//
//  Created by kila on 11/03/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class TranslateRecordService: NSObject {
    
    static let MODULE: String = "translate_record" // 模块
    
    static func list(pageIndex: Int, pageSize: Int, userID: String, callback: @escaping(Any) -> Void) -> Void{
        // 请求
        let action: String = "list"
        // 参数
        let parameters: [String: Any] = [
            "pageIndex": pageIndex,
            "pageSize": pageSize,
            "userID": userID
        ]
        ServicesManager.get(module: MODULE, action: action, parameters: parameters, callback: callback)
    }
}
