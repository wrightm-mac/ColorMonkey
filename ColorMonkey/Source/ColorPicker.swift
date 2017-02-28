//
//  ColorPickerView.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


@IBDesignable
open class ColorPicker: UIView, UIPickerViewDataSource, UIPickerViewDelegate {

    
    // MARK:    Inspectables...
    
    @IBInspectable open var showHexadecimal: Bool = true
    
    
    // MARK:    Fields...
    
    private var view: ColorPickerView!
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        view = initialiseFromNib() as! ColorPickerView
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        view = initialiseFromNib() as! ColorPickerView
    }
    
    public convenience init() {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        
        view = initialiseFromNib() as! ColorPickerView
    }


    // MARK:    Overrides...
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        view.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        view.backgroundColor = backgroundColor
        view.applyBorder(cornerSize: .medium, width: .medium, color: .black)
    }
    
    
    // MARK:    'UIPickerDatasource'...
    
    open func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    open func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 256
    }
    
    
    // MARK:    'UIPickerDelegate'...
    
    open func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return showHexadecimal ? String(format:"%02X", row) : "\(row)"
    }
}
