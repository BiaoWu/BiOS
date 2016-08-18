//
//  DateAndTimePickerVC.swift
//  BiOS
//
//  Created by BiaoWu on 16/8/18.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class DateAndTimePickerVC: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    let dateFormatter = NSDateFormatter()
    let timeFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Date And Time Picker"
        
        datePicker.datePickerMode = .Date
        timePicker.datePickerMode = .Time
        
        
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        timeFormatter.timeStyle = .ShortStyle
        timeFormatter.locale = NSLocale.currentLocale()
        timeFormatter.dateFormat = "HH:mm:ss"
    }
    
    @IBAction func done(sender: AnyObject) {
        dateTimeLabel.text = "Date: \(dateFormatter.stringFromDate(datePicker.date)) \t Time: \(timeFormatter.stringFromDate(timePicker.date))"
    }
}
