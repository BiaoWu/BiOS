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
    
    let dateFormatter = DateFormatter()
    let timeFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Date And Time Picker"
        
        datePicker.datePickerMode = .date
        timePicker.datePickerMode = .time
        
        
        dateFormatter.dateStyle = .short
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd"

        timeFormatter.timeStyle = .short
        timeFormatter.locale = Locale.current
        timeFormatter.dateFormat = "HH:mm:ss"
    }
    
    @IBAction func done(_ sender: AnyObject) {
        dateTimeLabel.text = "Date: \(dateFormatter.string(from: datePicker.date)) \t Time: \(timeFormatter.string(from: timePicker.date))"
    }
}
