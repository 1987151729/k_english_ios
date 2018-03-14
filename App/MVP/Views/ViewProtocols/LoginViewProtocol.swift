//
//  LoginViewProtocol.swift
//  App
//
//  Created by kila on 04/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: NSObjectProtocol {
    
    /* 操作需要的数据 */
    // 获取用户名
    func getUserName() -> String
    // 获取密码
    func getPassword() -> String
    
    /* 操作的结果，对应的反馈 */
    // 提示信息
    func showTips(tips: String)
    // 显示结果
    func showResult(state: Int)
    
    /* 操作过程中对应的友好的交互 */
    // 显示等待窗口
    func showLoading()
    // 关闭等待窗口
    func hideLoading()
}
