//
//  RgbColorPickerView.swift
//  ColorMonkey
//
//  Created by Michael Wright on 02/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class RgbColorPickerView: UIView {
    
    @IBOutlet weak var redPicker: UIPickerView!
    @IBOutlet weak var greenPicker: UIPickerView!
    @IBOutlet weak var bluePicker: UIPickerView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let pickerWidth = frame.width / 3.0
        
        redPicker.frame = CGRect(x: 0.0, y: 0.0, width: pickerWidth, height: frame.height)
        greenPicker.frame = CGRect(x: pickerWidth, y: 0.0, width: pickerWidth, height: frame.height)
        bluePicker.frame = CGRect(x: pickerWidth * 2.0, y: 0.0, width: pickerWidth, height: frame.height)
    }
}
