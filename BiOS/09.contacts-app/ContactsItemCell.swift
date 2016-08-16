//
//  ContactsItemCell.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/16.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class ContactsItemCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var user: User! {
        didSet {
            nameLabel.text = user.name
            avatarImage.image = user.avatar
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage.circle()
    }
}
