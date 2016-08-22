//
//  PhotoDetailVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/22.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class PhotoDetailVC: UIViewController {

    var detailView: PhotoDetailView!
    
    var photoItem: PhotoItem?
    
    
    override func awakeFromNib() {
        print("PhotoDetailVC awakeFromNib")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("PhotoDetailVC viewDidLoad")
        
        detailView = PhotoDetailView(frame: self.view.frame)
        detailView.photoItem = photoItem
        self.view.addSubview(detailView)
    }

}
