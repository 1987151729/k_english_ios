//
//  Music.swift
//  App
//
//  Created by kila on 26/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import ObjectMapper

class Music: Mappable {
    
    var id: String?
    var title: String?
    var description: String?
    var img: String?
    var query: String?
    var speakUrl: String?
    var translation: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.description <- map["description"]
        self.img <- map["img"]
        self.query <- map["query"]
        self.speakUrl <- map["speakUrl"]
        self.translation <- map["translation"]
    }
}
