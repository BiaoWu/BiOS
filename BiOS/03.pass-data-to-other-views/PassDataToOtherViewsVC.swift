//
//  PassDataToOtherViewsVC.swift
//  PassDataToOtherViews
//
//  Created by BiaoWu on 16/8/11.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class PassDataToOtherViewsVC: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segue" {
            let second = segue.destinationViewController as! SecondViewController
            
            second.passData = inputText.text
        }
    }
}

