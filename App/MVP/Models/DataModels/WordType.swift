//
//  WordType.swift
//  App
//
//  Created by kila on 24/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import ObjectMapper

class WordType: Mappable {
    
    var name: String?
    var description: String?
    var type: Int?
    var img: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.name <- map["name"]
        self.description <- map["description"]
        self.type <- map["type"]
        self.img <- map["img"]
    }
}
