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
    class Entry {
        var title: String!
        var storyBoardName: String!
        
        init(title: String,storyBoardName: String){
            self.title = title
            self.storyBoardName = storyBoardName
        }
    }
    
    private var data = [Entry]()
    
    init() {
        data.append(Entry(title:  "01.TapOrHoldCounter", storyBoardName: "TapOrHoldCounter"))
        data.append(Entry(title:  "02.tip-calculator", storyBoardName: "TipCalculator"))
        data.append(Entry(title:  "03.pass-data-to-other-views", storyBoardName: "pass-data-to-other-views"))
        data.append(Entry(title:  "04.swipe-to-dismiss-keyboard", storyBoardName: "swipe-to-dismiss-keyboard"))
        data.append(Entry(title:  "05.add-photo-from-camera-roll", storyBoardName: "add-photo-from-camera-roll"))
        data.append(Entry(title:  "06.pull-to-refresh", storyBoardName: "pull-to-refresh"))
        data.append(Entry(title:  "07.delete-and-rearrange", storyBoardName: "delete-and-rearrange"))
        data.append(Entry(title:  "08.sticky-section-headers", storyBoardName: "sticky-section-headers"))
        data.append(Entry(title:  "09.contacts-app", storyBoardName: "contacts-app"))
        data.append(Entry(title:  "10.timeline", storyBoardName: "timeline"))
        data.append(Entry(title:  "11.date-and-time-picker", storyBoardName: "date-and-time-picker"))
        data.append(Entry(title:  "12.photos", storyBoardName: "photos"))
        data.append(Entry(title:  "13.movie", storyBoardName: "movie"))
    }
    
    func size() -> Int {
        return data.count
    }
    
    func getItem(index: Int) -> Entry {
        return data[index]
    }
    
    func providerVc(index: Int) -> UIViewController {
        return UIStoryboard.init(name: getItem(index).storyBoardName, bundle: nil).instantiateInitialViewController()!
    }
}