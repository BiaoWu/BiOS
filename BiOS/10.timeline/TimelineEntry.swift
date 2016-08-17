//
//  TimelineEntry.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/17.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import Foundation
import UIKit

class TimelineEntry {
    var cover: UIImage?
    var date: String?
    var content: String?
    var location: String?
    
    init(cover: UIImage,
         date: String,
         content: String,
         location: String) {
        self.cover = cover
        self.content = content
        self.date = date
        self.location = location
    }
}