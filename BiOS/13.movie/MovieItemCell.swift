//
//  MovieItemCell.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/28.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

let ID_MovieItemCell = "movie_item_cell"

class MovieItemCell: UITableViewCell {
    
    var coverImageView: UIImageView!
    var titleLabel: UILabel!
    
    var lineView: UIView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        setUpViewsConstraint()
    }
    
    init () {
        super.init(style: .Default , reuseIdentifier: ID_MovieItemCell)
        
        setUpViews()
        setUpViewsConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        coverImageView = UIImageView()
        self.contentView.addSubview(coverImageView)
        
        titleLabel = UILabel()
        self.coverImageView.addSubview(titleLabel)
        
        lineView = UIView()
        lineView.backgroundColor = UIColor.grayColor()
        self.coverImageView.addSubview(lineView)
    }
    
    func setUpViewsConstraint() {
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.topAnchor.constraintEqualToAnchor(self.contentView.topAnchor).active = true
        coverImageView.leftAnchor.constraintEqualToAnchor(self.contentView.leftAnchor).active = true
        coverImageView.bottomAnchor.constraintEqualToAnchor(self.contentView.bottomAnchor).active = true
        coverImageView.widthAnchor.constraintEqualToAnchor(coverImageView.heightAnchor, multiplier: 1.0).active = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraintEqualToAnchor(self.contentView.topAnchor).active = true
        titleLabel.rightAnchor.constraintEqualToAnchor(self.contentView.rightAnchor).active = true
        titleLabel.bottomAnchor.constraintEqualToAnchor(self.contentView.bottomAnchor).active = true
        titleLabel.leftAnchor.constraintEqualToAnchor(coverImageView.rightAnchor).active = true
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.heightAnchor.constraintEqualToConstant(0.5).active = true
        lineView.rightAnchor.constraintEqualToAnchor(self.contentView.rightAnchor).active = true
        lineView.bottomAnchor.constraintEqualToAnchor(self.contentView.bottomAnchor).active = true
        lineView.leftAnchor.constraintEqualToAnchor(self.contentView.leftAnchor).active = true
    }
}
