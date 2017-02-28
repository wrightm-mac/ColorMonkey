//
//  ColorPickerView.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class ColorPickerView: UIView {

    @IBOutlet weak var redPicker: UIPickerView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        redPicker.debug(.red)
    }
}
