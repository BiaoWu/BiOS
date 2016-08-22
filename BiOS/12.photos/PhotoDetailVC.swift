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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(actionSheet))
    }

    func actionSheet() {
        let reprotAction = UIAlertAction.init(title: "Report", style: .Destructive) { (action) in
            print(action.title)
        }
        
        let shareAction = UIAlertAction.init(title: "Share", style: .Default) { (action) in
            print(action.title)
        }
        
        let saveAction = UIAlertAction.init(title: "Save Image", style: .Default) { (action) in
            print(action.title)
        }
        
        let copyAction = UIAlertAction.init(title: "Copy Link", style: .Default) { (action) in
            print(action.title)
        }
        
        let cancleAction = UIAlertAction.init(title: "Cancle", style: .Cancel) { (action) in
            print(action.title)
        }
        
        let alert = UIAlertController.init(title: nil, message: nil, preferredStyle: .ActionSheet)
        alert.addAction(reprotAction)
        alert.addAction(shareAction)
        alert.addAction(saveAction)
        alert.addAction(copyAction)
        alert.addAction(cancleAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
    }
}
