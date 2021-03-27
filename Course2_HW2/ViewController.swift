//
//  ViewController.swift
//  Course2_HW2
//
//  Created by admin on 24.03.2021.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    
    // Result view init
    @IBOutlet weak var resultView: UIView!
    
    // Labels init
    @IBOutlet weak var labelRedValue: UILabel!
    @IBOutlet weak var labelGreenValue: UILabel!
    @IBOutlet weak var labelBlueValue: UILabel!
    
    // Sliders init
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    // Inputs init
    @IBOutlet weak var inputRed: UITextField!
    @IBOutlet weak var inputGreen: UITextField!
    @IBOutlet weak var inputBlue: UITextField!
    
    // Main field init
    @IBOutlet var mainField: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //input add
        inputRed.addDoneButtonOnKeyboard()
        inputGreen.addDoneButtonOnKeyboard()
        inputBlue.addDoneButtonOnKeyboard()
        
        
        // View pre- features
        resultView.layer.cornerRadius = resultView.frame.width / 40
        resultView.backgroundColor = UIColor(red: CGFloat(sliderRed.value),
                                             green: CGFloat(sliderGreen.value),
                                             blue: CGFloat(sliderBlue.value),
                                             alpha: 1.0)
        
        // Sliders pre- features
        sliderRed.minimumTrackTintColor = .red
        sliderRed.maximumTrackTintColor = .gray
        sliderRed.minimumValue = 0
        sliderRed.maximumValue = 1
        
        sliderGreen.minimumTrackTintColor = .green
        sliderGreen.maximumTrackTintColor = .gray
        sliderGreen.minimumValue = 0
        sliderGreen.maximumValue = 1
        
        sliderBlue.minimumTrackTintColor = .blue
        sliderBlue.maximumTrackTintColor = .gray
        sliderBlue.minimumValue = 0
        sliderBlue.maximumValue = 1
        
        // Labels pre- features
        labelRedValue.text = String(sliderRed.value)
        labelGreenValue.text = String(sliderGreen.value)
        labelBlueValue.text = String(sliderBlue.value)
        
        // Inputs pre- load
        inputRed.text = String(sliderRed.value)
        inputGreen.text = String(sliderGreen.value)
        inputBlue.text = String(sliderBlue.value)
        
        //Input manipulation
        self.inputRed.delegate = self
        inputRed.keyboardType = .decimalPad
        inputGreen.keyboardType = .decimalPad
        inputBlue.keyboardType = .decimalPad
        
        
    }
    
    // Return button closes keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // code needed for Done button
//    let weNeed = inputRed.text!
//    if let result = Float(weNeed) {
//        sliderRed.value = result
//    } else {
//        inputRed.text = "Enter number, please"
//    }
    
    // Done Button action
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        sliderRed.value = inputRed.value
//     }
    
    

    @IBAction func actionRed(_ sender: Any) {
        let sliderRedValue = String(round(sliderRed.value * 100) / 100)
        labelRedValue.text = sliderRedValue
        inputRed.text = sliderRedValue
        resultView.backgroundColor = UIColor(red: CGFloat(sliderRed.value),
                                             green: CGFloat(sliderGreen.value),
                                             blue: CGFloat(sliderBlue.value),
                                             alpha: 1.0)
    }
    
    
    @IBAction func actionGreen(_ sender: Any) {
        let sliderGreenValue = String(round(sliderGreen.value * 100) / 100)
        labelGreenValue.text = sliderGreenValue
        inputGreen.text = sliderGreenValue
        resultView.backgroundColor = UIColor(red: CGFloat(sliderRed.value),
                                             green: CGFloat(sliderGreen.value),
                                             blue: CGFloat(sliderBlue.value),
                                             alpha: 1.0)
    }
    
    
    @IBAction func actionBlue(_ sender: Any) {
        let sliderBlueValue = String(round(sliderBlue.value * 100) / 100)
        labelBlueValue.text = sliderBlueValue
        inputBlue.text = sliderBlueValue
        resultView.backgroundColor = UIColor(red: CGFloat(sliderRed.value),
                                             green: CGFloat(sliderGreen.value),
                                             blue: CGFloat(sliderBlue.value),
                                             alpha: 1.0)
    }
    
    
    
}


extension UITextField{
    func addDoneButtonOnKeyboard() {
        let doneToolBar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width,  height: 50))
        doneToolBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolBar.items = items
        doneToolBar.sizeToFit()
        
        self.inputAccessoryView = doneToolBar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
