//
//  TabOrHoldCounterVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/9.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class TabOrHoldCounterVC: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var tabBtn: UIButton!
    
    var count : Int = 0 {
        didSet {
            countLabel.text = String(count)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = 0
        
        let tabG = UITapGestureRecognizer(target: self, action: #selector(tab))
        tabBtn.addGestureRecognizer(tabG)
        
        let longPressG = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        tabBtn.addGestureRecognizer(longPressG)
    }
    
    func tab() {
        count += 1
    }
    
    func longPress(sender: UIGestureRecognizer) {
        switch sender.state {
        case .Changed:
            count += 1
        default:
            //ignore
            break
        }
    }
    
    @IBAction func reset(sender: AnyObject) {
        count = 0
    }
}

