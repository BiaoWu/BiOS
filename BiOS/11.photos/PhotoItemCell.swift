//
//  PhotoItemCell.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/19.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class PhotoItemCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImage: UIImageView!
    
    func setPhotoItem(item: PhotoItem) {
        photoImage.image = UIImage(named: item.itemImage!)
    }
}
