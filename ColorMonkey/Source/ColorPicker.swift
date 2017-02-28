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
    
    @IBInspectable open var isHexadecimal: Bool = true
    
    
    // MARK:    Fields...
    
    private var view: ColorPickerView!
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        view = loadViewFromNib() as! ColorPickerView
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        view = loadViewFromNib() as! ColorPickerView
    }
    
    public convenience init() {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        
        view = loadViewFromNib() as! ColorPickerView
    }


    // MARK:    Overrides...
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        //view.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        view.frame = CGRect(x: 0.0, y: 0.0, width: 21.0, height: 21.0)
        view.debug(.yellow)
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
        return "\(row)"
    }
}
