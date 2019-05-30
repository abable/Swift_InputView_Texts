//
//  ViewController.swift
//  InputView
//
//  Created by Seungjun Lim on 30/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class GenderInputView: UIView, UIInputViewAudioFeedback {
    var enableInputClicksWhenVisible: Bool {
        return true
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var ageField: UITextField!
    
    @IBOutlet weak var genderField: UITextField!
    
    @IBOutlet var pickerContainerView: UIView!
    
    @IBOutlet var buttonContainerView: UIView!
    
    @IBOutlet var accessoryBar: UIToolbar!
    
    @IBAction func selectGender(_ sender: UIButton) {
//        print(sender.tag)
        genderField.text = sender.tag == 0 ? "M" : "F"
        
        UIDevice.current.playInputClick()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ageField.inputView = pickerContainerView
        genderField.inputView = buttonContainerView
        
        nameField.inputAccessoryView = accessoryBar
        ageField.inputAccessoryView = accessoryBar
        genderField.inputAccessoryView = accessoryBar
    }
}
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row + 1)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ageField.text = "\(row + 1)"
    }
}

