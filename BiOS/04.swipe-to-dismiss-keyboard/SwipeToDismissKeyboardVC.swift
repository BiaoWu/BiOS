//
//  SwipeToDismissKeyboardVC.swift
//  SwipeToDismissKeyboard
//
//  Created by BiaoWu on 16/8/11.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class SwipeToDismissKeyboardVC: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDismiss))
        gesture.direction = .Down
        
        textView.addGestureRecognizer(gesture)
        
        textView.becomeFirstResponder()
    }
    
    func swipeDismiss() {
        textView.endEditing(true)
    }
    
}

