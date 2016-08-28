//
//  MovieEntry.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/28.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import Foundation

class MovieEntry {
    var title: String!
    var imageName: String!
    
    init(_ title: String, _ imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}