//
//  ServerManager.swift
//  App
//
//  Created by kila on 28/01/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import Alamofire

class ServicesManager: NSObject {
    
    static func request(method: HTTPMethod, module: String, action: String, parameters: Parameters, callback: @escaping(Any) -> Void){
        // 加入公共参数
        var parameters_ = parameters
        parameters_["EntryKey"] = ""
        parameters_["EntrySecret"] = ""
        parameters_["Device"] = Constants.Configs.DEVICE // 设备类型
        parameters_["Version"] = Constants.Configs.VERSION // 版本
        parameters_["Channel"] = Constants.Configs.CHANNEL // 渠道
        
        let url: String = Constants.Configs.API_SITE + module + "/" + action + "/" // 注：这里最后的"/"必须要有，否则php服务端接收不了post请求
        Alamofire.request(url, method: method, parameters: parameters_, encoding: URLEncoding.default)
            .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                //                print("Progress: \(progress.fractionCompleted)")
            }
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseJSON { response in
//                                debugPrint(response)
                callback(response.value!)
        }
    }
    
    static func get(module: String, action: String, parameters: Parameters, callback: @escaping(Any) -> Void){
        request(method: .get, module: module, action: action, parameters: parameters, callback: callback)
    }
    
    static func post(module: String, action: String, parameters: Parameters, callback: @escaping(Any) -> Void){
        request(method: .post, module: module, action: action, parameters: parameters, callback: callback)
    }
}
