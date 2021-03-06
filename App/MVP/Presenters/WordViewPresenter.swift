//
//  WordViewPresenter.swift
//  App
//
//  Created by kila on 04/03/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class WordViewPresenter: NSObject {
    
    let viewProtocol: WordViewProtocol?
    
    // 构造函数
    init(viewProtocol: WordViewProtocol) {
        self.viewProtocol = viewProtocol
    }
    
    /* 业务逻辑处理 */
    
    // 下拉刷新
    func refresh(){
        let pageIndex = viewProtocol?.getPageIndex()
        let pageSize = viewProtocol?.getPageSize()
        let type = viewProtocol?.getType()
        WordService.list(pageIndex: pageIndex!, pageSize: pageSize!, type: type!, callback:{(data: Any) -> Void in
            let json = JSON(data)
            let jsonArray = json.arrayValue
            var list = [Word]()
            for raw in jsonArray{
                let item = Word(JSONString: raw.rawString()!)
                list.append(item!)
            }
            self.viewProtocol?.refresh(list: list)
        })
    }
    
    // 上拉加载
    func load(){
        let pageIndex = viewProtocol?.getPageIndex()
        let pageSize = viewProtocol?.getPageSize()
        let type = viewProtocol?.getType()
        WordService.list(pageIndex: pageIndex!, pageSize: pageSize!, type: type!, callback:{(data: Any) -> Void in
            let json = JSON(data)
            let jsonArray = json.arrayValue
            var list = [Word]()
            for raw in jsonArray{
                let item = Word(JSONString: raw.rawString()!)
                list.append(item!)
            }
            self.viewProtocol?.load(list: list)
        })
    }
}
