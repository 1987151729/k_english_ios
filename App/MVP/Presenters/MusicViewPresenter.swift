//
//  MusicPresenter.swift
//  App
//
//  Created by kila on 26/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class MusicViewPresenter: NSObject {
    
    let viewProtocol: MusicViewProtocol?
    
    // 构造函数
    init(viewProtocol: MusicViewProtocol) {
        self.viewProtocol = viewProtocol
    }
    
    /* 业务逻辑处理 */
    
    // 下拉刷新
    func refresh(){
        let pageIndex = viewProtocol?.getPageIndex()
        let pageSize = viewProtocol?.getPageSize()
        MusicService.list(pageIndex: pageIndex!, pageSize: pageSize!, callback:{(data: Any) -> Void in
            let json = JSON(data)
            let jsonArray = json.arrayValue
            var list = [Music]()
            for raw in jsonArray{
                let item = Music(JSONString: raw.rawString()!)
                list.append(item!)
            }
            self.viewProtocol?.refresh(list: list)
        })
    }
    
    // 上拉加载
    func load(){
        let pageIndex = viewProtocol?.getPageIndex()
        let pageSize = viewProtocol?.getPageSize()
        MusicService.list(pageIndex: pageIndex!, pageSize: pageSize!, callback:{(data: Any) -> Void in
            let json = JSON(data)
            let jsonArray = json.arrayValue
            var list = [Music]()
            for raw in jsonArray{
                let item = Music(JSONString: raw.rawString()!)
                list.append(item!)
            }
            self.viewProtocol?.load(list: list)
        })
    }
}
