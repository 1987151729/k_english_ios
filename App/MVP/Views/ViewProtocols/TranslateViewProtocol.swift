//
//  TranslateViewProtocol.swift
//  App
//
//  Created by kila on 10/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

protocol TranslateViewProtocol: NSObjectProtocol {

    /* 操作需要的数据 */
    // 获取待翻译内容
    func getContent() -> String
    // 获取类别
    func getType() -> Int
    
    /* 操作的结果，对应的反馈 */
    // 提示信息
    func showTips(tips: String)
    // 显示翻译结果
    func showResult(translate: Translate)
    
    /* 操作过程中对应的友好的交互 */
    // 显示等待窗口
    func showLoading()
    // 关闭等待窗口
    func hideLoading()
}
