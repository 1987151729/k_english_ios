//
//  LoginViewProtocol.swift
//  App
//
//  Created by kila on 04/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: NSObjectProtocol {
    // 获取用户名
    func getUserName() -> String
    // 获取密码
    func getPassword() -> String
    
}
