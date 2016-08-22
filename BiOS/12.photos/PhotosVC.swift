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
    
    private func initData() {
        if let inputFile = NSBundle.mainBundle().pathForResource("photo_items", ofType: "plist")  {
            let inputDataArray = NSArray(contentsOfFile: inputFile)
            
            for inputData in inputDataArray as! [Dictionary<String, String>] {
                data.append(PhotoItem(inputData))
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoItemCell
        
        // Configure the cell
        cell.setPhotoItem(data[indexPath.row])
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vc = PhotoDetailVC()
        vc.photoItem = data[indexPath.row]
        showViewController(vc, sender: nil)
    }
}
