//
//  PhotosVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/19.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PhotosVC: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    var data = [PhotoItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        
        self.title = "Photos"
    }
    
    fileprivate func initData() {
        if let inputFile = Bundle.main.path(forResource: "photo_items", ofType: "plist")  {
            let inputDataArray = NSArray(contentsOfFile: inputFile)
            
            for inputData in inputDataArray as! [Dictionary<String, String>] {
                data.append(PhotoItem(inputData))
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoItemCell
        
        // Configure the cell
        cell.setPhotoItem(data[(indexPath as NSIndexPath).row])
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PhotoDetailVC()
        vc.photoItem = data[(indexPath as NSIndexPath).row]
        show(vc, sender: nil)
    }
}
