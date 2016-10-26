//
//  TimelineItemCell.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/17.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class TimelineItemCell: UITableViewCell {

    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var locationLabel: UILabel!
    
    var entry: TimelineEntry! {
        didSet {
            coverImage.image = entry.cover
            dateLabel.text = entry.date
            contentTextView.text = entry.content
            locationLabel.text = entry.location
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
