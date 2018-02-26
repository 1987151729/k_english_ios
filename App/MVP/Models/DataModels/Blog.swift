//
//  Blog.swift
//  App
//
//  Created by kila on 14/02/2018.
//  Copyright © 2018 kila. All rights reserved.
//

import UIKit
import ObjectMapper

class Blog: Mappable {
    
    var id: String?
    var userID: String?
    var content: String?
    var imgs: String? {
        didSet{
            if !imgs!.isEmpty {
                self.imgArr = imgs?.components(separatedBy: ",")
            }
        }
    }
    var checkNum: Int64?
    var likeNum: Int64?
    var commentNum: Int64?
    var createdAt: Date?
    // kz
    var user: User?
    var imgArr: [String]? = [String]()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.userID <- map["userID"]
        self.content <- map["content"]
        self.imgs <- map["imgs"]
        self.checkNum <- map["checkNum"]
        self.likeNum <- map["likeNum"]
        self.commentNum <- map["commentNum"]
        self.createdAt <- (map["createdAt"], ObjectMapperDateTransform())
    }
}
