//
//  ColorPickerView.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class HslColorPickerView: UIView {

    @IBOutlet weak var huePicker: UIPickerView!
    @IBOutlet weak var saturationPicker: UIPickerView!
    @IBOutlet weak var brightnessPicker: UIPickerView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let pickerWidth = frame.width / 3.0
        
        huePicker.frame = CGRect(x: 0.0, y: 0.0, width: pickerWidth, height: frame.height)
        saturationPicker.frame = CGRect(x: pickerWidth, y: 0.0, width: pickerWidth, height: frame.height)
        brightnessPicker.frame = CGRect(x: pickerWidth * 2.0, y: 0.0, width: pickerWidth, height: frame.height)
    }
}
