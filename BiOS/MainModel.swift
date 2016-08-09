//
//  MainModel.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/9.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import Foundation
import UIKit

class MainModel {
    let tapOrHolderCounter = "01.TabOrHoldCounter"
    
    private var data = [String]()
    
    init() {
        data.append(tapOrHolderCounter)
    }
    
    func size() -> Int {
        return data.count
    }
    
    func getItem(index: Int) -> String {
        return data[index]
    }
    
    func providerVc(name: String) -> UIViewController? {
        switch name {
        case tapOrHolderCounter:
            return UIStoryboard.init(name: "TabOrHoldCounter", bundle: nil).instantiateInitialViewController()
        default:
            return nil
        }
    }
}