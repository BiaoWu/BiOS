//
//  SecondViewController.swift
//  PassDataToOtherViews
//
//  Created by BiaoWu on 16/8/11.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    var passData : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("passData : \(passData)")
        
        dataLabel.text = passData
    }
}
