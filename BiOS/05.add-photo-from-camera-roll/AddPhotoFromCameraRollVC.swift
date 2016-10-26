//
//  AddPhotoFromCameraRollVC.swift
//  SelectPhotoFromCameraRoll
//
//  Created by BiaoWu on 16/8/11.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class AddPhotoFromCameraRollVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        imageView.contentMode = .scaleAspectFit
        
        imagePicker.delegate = self
    }

    @IBAction func selectPhoto(_ sender: AnyObject) {
        
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        imageView.image = image
        
        dismiss(animated: true, completion: nil)
    }
}

