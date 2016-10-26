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
        super.init(style: .default , reuseIdentifier: ID_MovieItemCell)
        
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
        lineView.backgroundColor = UIColor.gray
        self.coverImageView.addSubview(lineView)
    }
    
    func setUpViewsConstraint() {
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        coverImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        coverImageView.widthAnchor.constraint(equalTo: coverImageView.heightAnchor, multiplier: 1.0).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor).isActive = true
        
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        lineView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        lineView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        lineView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
    }
}
