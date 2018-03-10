//
//  Sentence.swift
//  App
//
//  Created by kila on 04/03/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import ObjectMapper

class Sentence: Mappable {
    
    var id: String?
    var query: String?
    var speakUrl: String?
    var translation: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.query <- map["query"]
        self.speakUrl <- map["speakUrl"]
        self.translation <- map["translation"]
    }
}
