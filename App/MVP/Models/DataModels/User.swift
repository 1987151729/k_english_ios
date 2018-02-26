//
//  User.swift
//  App
//
//  Created by kila on 14/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import ObjectMapper

class User: Mappable {
    
    var no: Int64?
    var userID: String?
    var name: String?
    var sex: Int?
    var avatar: String?
    var age: Int?
    var constellation: String?
    var birth: Date?
    var city: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.no <- map["no"]
        self.userID <- map["userID"]
        self.name <- map["name"]
        self.sex <- map["sex"]
        self.avatar <- map["avatar"]
        self.age <- map["age"]
        self.constellation <- map["constellation"]
        self.birth <- map["birth"]
        self.city <- map["city"]
    }
}
