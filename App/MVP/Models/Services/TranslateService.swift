//
//  api_translate.swift
//  App
//
//  Created by kila on 10/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class TranslateService: NSObject {

    static let MODULE: String = "translate" // 模块
    
    static func query(userID: String, query: String, type: Int, callback: @escaping(Any) -> Void) -> Void{
        // 请求
        let action: String = "query"
        // 参数
        let parameters: [String: Any] = [
            "userID": userID,
            "query": query,
            "type": type
        ]
        ServicesManager.get(module: MODULE, action: action, parameters: parameters, callback: callback)
    }
}
