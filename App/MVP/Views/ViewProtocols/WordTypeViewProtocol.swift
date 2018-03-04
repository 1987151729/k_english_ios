//
//  WordTypeViewProtocol.swift
//  App
//
//  Created by kila on 24/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit

protocol WordTypeViewProtocol: NSObjectProtocol {

    /* 操作需要的数据 */
    // 获取页码
    func getPageIndex() -> Int
    // 获取每页大小
    func getPageSize() -> Int
    
    /* 操作的结果，对应的反馈 */
    // 下拉刷新
    func refresh(list: [WordType])
    // 上拉加载
    func load(list: [WordType])
    
    /* 操作过程中对应的友好的交互 */
}
