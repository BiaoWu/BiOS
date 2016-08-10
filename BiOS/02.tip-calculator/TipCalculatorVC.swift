//
//  ViewController.swift
//  TipCalculator
//
//  Created by BiaoWu on 16/8/6.
//  Copyright © 2016年 BiaoWu. All rights reserved.
//

import UIKit

class TipCalculatorVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    
    
    var formatter = NSNumberFormatter()
    
    var mealPrice = 0.0 {
        didSet {
            inputText.text = formatter.stringFromNumber(mealPrice)
        }
    }
    
    var tipPercent = 0 {
        didSet {
            tipLabel.text = "Tip (\(tipPercent)%)"
            tipSlider.value = Float(tipPercent)
        }
    }
    var tipPrice = 0.0 {
        didSet {
            tipPriceLabel.text = formatter.stringFromNumber(tipPrice)
        }
    }
    var totalPrice = 0.0 {
        didSet {
            totalPriceLabel.text = formatter.stringFromNumber(totalPrice)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.numberStyle = .CurrencyStyle
        
        inputText.keyboardType = UIKeyboardType.NumberPad
        
        addToolBar(inputText)
        
        tipSlider.minimumValue = 0
        tipSlider.maximumValue = 100
        tipSlider.value = 25
        tipSlider.addTarget(self, action: #selector(tipSliderValueChange), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    //toolbar
    func addToolBar(textField: UITextField){
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: #selector(donePressed))
        
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField == self.inputText {
            reset()
        }
    }
    
    func donePressed() {
        self.view.endEditing(true)
        let valueStr = (inputText.text == nil || inputText.text == "") ? "0" : inputText.text!
        mealPrice = Double(valueStr)!
        calculateTip()
    }
    
    func tipSliderValueChange() {
        calculateTip()
    }
    
    func calculateTip() {
        tipPercent = Int(tipSlider.value)
        tipPrice = mealPrice * Double(tipPercent) * 0.01
        totalPrice = mealPrice + tipPrice
    }
    
    func reset() {
        mealPrice   =   0
        tipPercent  =   25
        tipPrice    =   0
        totalPrice  =   0
        inputText.text = ""
    }
}

