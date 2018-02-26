//
//  SentenceTypeViewProtocol.swift
//  App
//
//  Created by kila on 26/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

protocol SentenceTypeViewProtocol: NSObjectProtocol {

    /* 操作需要的数据 */
    // 获取页码
    func getPageIndex() -> Int
    // 获取每页大小
    func getPageSize() -> Int
    
    /* 操作的结果，对应的反馈 */
    // 下拉刷新
    func refresh(sentenceTypeList: [SentenceType])
    // 上拉加载
    func load(sentenceTypeList: [SentenceType])
    
    /* 操作过程中对应的友好的交互 */
}
