//
//  TranslateRecordViewPresenter.swift
//  App
//
//  Created by kila on 11/03/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class TranslateRecordViewPresenter: NSObject {
    
    let viewProtocol: TranslateRecordViewProtocol?
    
    // 构造函数
    init(viewProtocol: TranslateRecordViewProtocol) {
        self.viewProtocol = viewProtocol
    }
    
    /* 业务逻辑处理 */
    
    // 下拉刷新
    func refresh(){
        let pageIndex = viewProtocol?.getPageIndex()
        let pageSize = viewProtocol?.getPageSize()
        let userID = "1000010000000007"
        TranslateRecordService.list(pageIndex: pageIndex!, pageSize: pageSize!, userID: userID, callback:{(data: Any) -> Void in
            let json = JSON(data)
            let jsonArray = json.arrayValue
            var list = [TranslateRecord]()
            for raw in jsonArray{
                let item = TranslateRecord(JSONString: raw.rawString()!)
                list.append(item!)
            }
            self.viewProtocol?.refresh(list: list)
        })
    }
    
    // 上拉加载
    func load(){
        let pageIndex = viewProtocol?.getPageIndex()
        let pageSize = viewProtocol?.getPageSize()
        let userID = ""
        TranslateRecordService.list(pageIndex: pageIndex!, pageSize: pageSize!, userID: userID, callback:{(data: Any) -> Void in
            let json = JSON(data)
            let jsonArray = json.arrayValue
            var list = [TranslateRecord]()
            for raw in jsonArray{
                let item = TranslateRecord(JSONString: raw.rawString()!)
                list.append(item!)
            }
            self.viewProtocol?.load(list: list)
        })
    }
}
