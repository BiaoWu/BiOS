//
//  MovieBannerCell.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/24.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class MovieBannerCell: UITableViewCell {
    
    var bannerView: BannerView!
    
    var images: [UIImage?]? {
        didSet {
            bannerView.images = images
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bannerView = BannerView()
        self.contentView.addSubview(bannerView)
        
        // 1.
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        bannerView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        bannerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        bannerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        // 2.
        // self.bannerView.frame = CGRectMake(0, 0, self.contentView.frame.width, self.contentView.frame.height)
    }
}
