//
//  User.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/16.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import Foundation
import UIKit

class User {
    var name: String
    var avatar: UIImage?
    var mobile: String
    var email: String
    var notes: String
    
    init(name: String, avatar: UIImage?, mobile: String, email: String, notes: String){
        self.name = name
        self.avatar = avatar
        self.mobile = mobile
        self.email = email
        self.notes = notes
    }
}