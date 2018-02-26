//
//  TranslateViewPresenter.swift
//  App
//
//  Created by kila on 10/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class TranslateViewPresenter: NSObject {
    
    let viewProtocol: TranslateViewProtocol?
    
    // 构造函数
    init(viewProtocol: TranslateViewProtocol) {
        self.viewProtocol = viewProtocol
    }
    
    /* 业务逻辑处理 */
    
    // 翻译
    func translate(){
        let userID = ""
        let content = (viewProtocol?.getContent())!
        let type = (viewProtocol?.getType())!
        
        if content.isEmpty{
            self.viewProtocol?.showTips(tips: NSLocalizedString("translate_tips_content_empty", comment: ""))
        }else{
            self.viewProtocol?.showLoading()
            TranslateService.query(userID: userID, query: content, type: type, callback:{(data: Any) -> Void in
                let json = JSON(data)
                let state = json["state"]
                if 1==state{
                    let item = Translate(JSONString: json["result"].rawString()!)
                    self.viewProtocol?.showResult(translate: item!)
                }
                self.viewProtocol?.hideLoading()
            })
        }
    }
}
