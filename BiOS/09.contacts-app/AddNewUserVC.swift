//
//  AddNewUserVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/16.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

protocol AddNewUserListener {
    func onAddNewUser(_ user: User)
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        self.avatarImage.circle()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(save))
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShow(_ sender: Notification) {
        self.view.frame.origin.y = -150
    }
    
    func keyboardWillHide(_ sender: Notification) {
        self.view.frame.origin.y = 0
    }
    
    func save() {
        guard avatarImage.image != nil else {
            print("avatarImage cannot be nil")
            return
        }
        
        guard let name = nameTextField.text , name.characters.count > 0 else {
            print("name cannot be nil")
            return
        }
        
        guard let phone = phoneTextField.text , phone.characters.count > 0 else {
            print("phone cannot be nil")
            return
        }
        
        guard let email = emailTextField.text , email.characters.count > 0 else {
            print("email cannot be nil")
            return
        }
        
        guard let note = noteTextField.text , note.characters.count > 0 else {
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
        
        self.navigationController!.popViewController(animated: true)
    }
    
    @IBAction func addNewPhoto(_ sender: AnyObject) {
        let vc = UIImagePickerController()
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        avatarImage.image = image
        
        dismiss(animated: true, completion: nil)
    }
}
