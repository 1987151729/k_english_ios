//
//  SentenceService.swift
//  App
//
//  Created by kila on 04/03/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class SentenceService: NSObject {
    
    static let MODULE: String = "sentence" // 模块
    
    static func list(pageIndex: Int, pageSize: Int, type: Int, callback: @escaping(Any) -> Void) -> Void{
        // 请求
        let action: String = "list"
        // 参数
        let parameters: [String: Any] = [
            "pageIndex": pageIndex,
            "pageSize": pageSize,
            "type": type
        ]
        ServicesManager.get(module: MODULE, action: action, parameters: parameters, callback: callback)
    }
}
