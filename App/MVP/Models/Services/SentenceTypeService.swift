//
//  SentenceTypeService.swift
//  App
//
//  Created by kila on 26/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

class SentenceTypeService: NSObject {
    
    static let MODULE: String = "sentence_type" // 模块
    
    static func list(pageIndex: Int, pageSize: Int, callback: @escaping(Any) -> Void) -> Void{
        // 请求
        let action: String = "list"
        // 参数
        let parameters: [String: Any] = [
            "pageIndex": pageIndex,
            "pageSize": pageSize
        ]
        ServicesManager.get(module: MODULE, action: action, parameters: parameters, callback: callback)
    }
}
