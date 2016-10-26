//
//  PhotoDetailView.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/22.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class PhotoDetailView: UIScrollView {
    
    var photoImage: UIImageView!
    var contentLabel: UITextView!
    
    var photoItem: PhotoItem?
    
    
    override func setNeedsDisplay() {
        self.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 255)
        
        photoImage = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width))
        self.addSubview(photoImage)
        
        contentLabel = UITextView(frame: CGRect(x: 0, y: self.frame.width, width: self.frame.width, height: 0))
        contentLabel.isEditable = false
        contentLabel.isSelectable = false
        contentLabel.isScrollEnabled = false
        contentLabel.font = UIFont.systemFont(ofSize: 20)
        
        self.addSubview(contentLabel)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        if let item = photoItem {
            photoImage.image = UIImage(named: item.itemImage!)
        }
        
        if let content = photoItem?.content {
            contentLabel.text = content
            
            // 调整UITextView高度
            let contentSize = contentLabel.sizeThatFits(contentLabel.bounds.size)
            var frame = contentLabel.frame
            frame.size.height = contentSize.height
            contentLabel.frame = frame
            
            // 调整ScrollView的contentSize
            self.contentSize = CGSize(width: self.frame.width, height: self.frame.width + frame.height)
        }
    }
}
