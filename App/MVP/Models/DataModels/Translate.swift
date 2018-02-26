//
//  Translate.swift
//  App
//
//  Created by kila on 10/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import ObjectMapper

// 翻译类
class Translate: Mappable {

    var id: String?
    var query: String?
    var speakUrl: String?
    var tSpeakUrl: String?
    var translation: String?
    var phonetic: String?
    var ukPhonetic: String?
    var usPhonetic: String?
    var explains: String?
    var queryResult: String?
    var type: String?
    var createdAt: Date?
    var updatedAt: Date?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.query <- map["query"]
        self.speakUrl <- map["speakUrl"]
        self.tSpeakUrl <- map["tSpeakUrl"]
        self.translation <- map["translation"]
        self.phonetic <- map["phonetic"]
        self.ukPhonetic <- map["ukPhonetic"]
        self.usPhonetic <- map["usPhonetic"]
        self.explains <- map["explains"]
        self.queryResult <- map["queryResult"]
        self.type <- map["type"]
        self.createdAt <- map["createdAt"]
        self.updatedAt <- map["updatedAt"]
    }
}

// 翻译类型枚举
enum TranslateType: Int{
    case EnToCh = 0 // 英译中
    case ChToEn = 1 // 中译英
}
