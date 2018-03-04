//
//  WordTypePresenter.swift
//  App
//
//  Created by kila on 24/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class WordTypeViewPresenter: NSObject {
    
    let viewProtocol: WordTypeViewProtocol?
    
    // 构造函数
    init(viewProtocol: WordTypeViewProtocol) {
        self.viewProtocol = viewProtocol
    }
    
    /* 业务逻辑处理 */
    
    // 下拉刷新
    func refresh(){
        let pageIndex = viewProtocol?.getPageIndex()
        let pageSize = viewProtocol?.getPageSize()
        WordTypeService.list(pageIndex: pageIndex!, pageSize: pageSize!, callback:{(data: Any) -> Void in
            let json = JSON(data)
            let jsonArray = json.arrayValue
            var list = [WordType]()
            for raw in jsonArray{
                let item = WordType(JSONString: raw.rawString()!)
                list.append(item!)
            }
            self.viewProtocol?.refresh(list: list)
        })
    }
    
    // 上拉加载
    func load(){
        let pageIndex = viewProtocol?.getPageIndex()
        let pageSize = viewProtocol?.getPageSize()
        WordTypeService.list(pageIndex: pageIndex!, pageSize: pageSize!, callback:{(data: Any) -> Void in
            let json = JSON(data)
            let jsonArray = json.arrayValue
            var list = [WordType]()
            for raw in jsonArray{
                let item = WordType(JSONString: raw.rawString()!)
                list.append(item!)
            }
            self.viewProtocol?.load(list: list)
        })
    }
}
