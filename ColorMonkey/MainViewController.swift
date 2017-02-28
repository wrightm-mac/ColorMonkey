//
//  ViewController.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    // MARK:    Overrides...
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK:    'UIPickerDatasource'...
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 256
    }
    
    
    // MARK:    'UIPickerDelegate'...
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
}

