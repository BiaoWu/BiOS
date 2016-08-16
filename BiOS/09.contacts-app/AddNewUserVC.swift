//
//  AddNewUserVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/16.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

protocol AddNewUserListener {
    func onAddNewUser(user: User)
}

class AddNewUserVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    
    var addNewUserListener: AddNewUserListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        self.avatarImage.circle()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(save))
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    func save() {
        guard avatarImage.image != nil else {
            print("avatarImage cannot be nil")
            return
        }
        
        guard let name = nameTextField.text where name.characters.count > 0 else {
            print("name cannot be nil")
            return
        }
        
        guard let phone = phoneTextField.text where phone.characters.count > 0 else {
            print("phone cannot be nil")
            return
        }
        
        guard let email = emailTextField.text where email.characters.count > 0 else {
            print("email cannot be nil")
            return
        }
        
        guard let note = noteTextField.text where note.characters.count > 0 else {
            print("note cannot be nil")
            return
        }
        
        addNewUserListener?.onAddNewUser(User(
            name: name,
            avatar: avatarImage.image,
            mobile: phone,
            email: email,
            notes: note)
        )
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func addNewPhoto(sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        avatarImage.image = image
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
