//
//  ContactsModel.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/16.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import Foundation
import UIKit

class ContactsModel {
    var recent = [User]()
    var data = [User]()
    
    init() {
        let biao = User(
            name: "Biao",
            avatar: UIImage(named: "avatar 1"),
            mobile: "13112341234",
            email: "10@test.com",
            notes: "懒的很")
        
        let john = User(
            name: "John",
            avatar: UIImage(named: "avatar 3"),
            mobile: "1399996666",
            email: "22@test.com",
            notes: "Sao Jian He Yi")
        
        let bill = User(
            name: "Bill",
            avatar: UIImage(named: "avatar 4"),
            mobile: "13888888888",
            email: "11@test.com",
            notes: "懒的很")
        
        recent.append(bill)
        recent.append(john)
        
        data.append(biao)
        data.append(bill)
        data.append(john)
    }
    
    func addNewUser(user: User) {
        data.append(user)
    }
    
    func numberOfSections() -> Int {
        return 2
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        switch section {
        case 0:
            return recent.count
        case 1:
            return data.count
        default:
            return 0
        }
    }
    
    func titleForHeaderInSection(section: Int) -> String? {
        switch section {
        case 0:
            return "1"
        case 1:
            return "2"
        default:
            return nil
        }
    }
    
    func getItem(section: Int, _ row: Int) -> User? {
        switch section {
        case 0:
            return recent[row]
        case 1:
            return data[row]
        default:
            return nil
        }
    }
}