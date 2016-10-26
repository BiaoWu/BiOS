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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView = PhotoDetailView(frame: self.view.frame)
        detailView.photoItem = photoItem
        self.view.addSubview(detailView)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(actionSheet))
    }

    func actionSheet() {
        let reprotAction = UIAlertAction.init(title: "Report", style: .destructive) { (action) in
            print(action.title)
        }
        
        let shareAction = UIAlertAction.init(title: "Share", style: .default) { (action) in
            print(action.title)
        }
        
        let saveAction = UIAlertAction.init(title: "Save Image", style: .default) { (action) in
            print(action.title)
        }
        
        let copyAction = UIAlertAction.init(title: "Copy Link", style: .default) { (action) in
            print(action.title)
        }
        
        let cancleAction = UIAlertAction.init(title: "Cancle", style: .cancel) { (action) in
            print(action.title)
        }
        
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(reprotAction)
        alert.addAction(shareAction)
        alert.addAction(saveAction)
        alert.addAction(copyAction)
        alert.addAction(cancleAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
