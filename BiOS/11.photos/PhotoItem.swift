//
//  PhotoItem.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/19.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import Foundation

class PhotoItem {
    var itemImage: String?
    var content: String?
    
    
    init(_ dic: Dictionary<String, String>) {
        self.itemImage = dic["itemImage"]
        self.content = dic["content"]
    }
}