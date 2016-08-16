//
//  UserInfoVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/16.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var noteLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        avatarImage.circle()
        
        fillUser(user!)
    }
    
    func fillUser(user: User) {
        avatarImage.image = user.avatar
        nameLabel.text = user.name
        emailLabel.text = user.email
        phoneLabel.text = user.mobile
        noteLabel.text = user.notes
    }
}
