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
    let tapOrHolderCounter = "01.TapOrHoldCounter"
    let tipCalculator = "02.tip-calculator"
    
    private var data = [String]()
    
    init() {
        data.append(tapOrHolderCounter)
        data.append(tipCalculator)
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
            return UIStoryboard.init(name: "TapOrHoldCounter", bundle: nil).instantiateInitialViewController()
        case tipCalculator:
            return UIStoryboard.init(name: "TipCalculator", bundle: nil).instantiateInitialViewController()
        default:
            return nil
        }
    }
}