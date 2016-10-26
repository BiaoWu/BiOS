//
//  AddNewEntryVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/17.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

protocol OnAddNewEntryDelegate {
    func onAddNewEntry(_ entry: TimelineEntry)
}

class AddNewEntryVC: UIViewController {
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var coverImage: UIImageView!
    
    var delegate: OnAddNewEntryDelegate?
    
    var fomatter = DateFormatter()
    
    override func viewDidLoad() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(save))
        
        fomatter.locale = Locale.current
        fomatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    func save() {
        guard let image = coverImage.image else {
            print("please select a image")
            return
        }
        
        guard let content = contentTextView.text else {
            print("please input content")
            return
        }
        
        let now = fomatter.string(from: Date())
        
        //todo
        let location = "BeiJing"
        
        delegate?.onAddNewEntry(TimelineEntry(cover: image, date: now, content: content, location: location))
        
        self.navigationController!.popViewController(animated: true)
    }
}
