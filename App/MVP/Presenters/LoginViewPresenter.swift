//
//  LoginViewPresenter.swift
//  App
//
//  Created by kila on 12/03/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class LoginViewPresenter: NSObject {
    
    let viewProtocol: LoginViewProtocol?
    
    // 构造函数
    init(viewProtocol: LoginViewProtocol) {
        self.viewProtocol = viewProtocol
    }
    
    /* 业务逻辑处理 */
    
    // 登录
    func login(){

    }
}
