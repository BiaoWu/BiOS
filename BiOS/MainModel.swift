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
    let passDataToOtherViews = "03.pass-data-to-other-views"
    let swipeToDismissKeyboard = "04.swipe-to-dismiss-keyboard"
    let addPhotoFromCameraRoll = "05.add-photo-from-camera-roll"
    let pullToRefresh = "06.pull-to-refresh"
    
    private var data = [String]()
    
    init() {
        data.append(tapOrHolderCounter)
        data.append(tipCalculator)
        data.append(passDataToOtherViews)
        data.append(swipeToDismissKeyboard)
        data.append(addPhotoFromCameraRoll)
        data.append(pullToRefresh)
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
        case passDataToOtherViews:
            return UIStoryboard.init(name: "pass-data-to-other-views", bundle: nil).instantiateInitialViewController()
        case swipeToDismissKeyboard:
            return UIStoryboard.init(name: "swipe-to-dismiss-keyboard", bundle: nil).instantiateInitialViewController()
        case addPhotoFromCameraRoll:
            return UIStoryboard.init(name: "add-photo-from-camera-roll", bundle: nil).instantiateInitialViewController()
        case pullToRefresh:
            return UIStoryboard.init(name: "pull-to-refresh", bundle: nil).instantiateInitialViewController()
        default:
            return nil
        }
    }
}