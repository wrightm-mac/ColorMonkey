//
//  ColorPickerView.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


@IBDesignable
open class HslColorPicker: UIControl, UIPickerViewDataSource, UIPickerViewDelegate {

    
    // MARK:    Inspectables...
    
    //!@IBInspectable open var showHexadecimal: Bool = true
    
    @IBInspectable open var selectedColor: UIColor = .black {
        didSet {
            selectColor(selectedColor)
        }
    }
    
    @IBInspectable open var animateSelection: Bool = true
    
    
    // MARK:    Fields...
    
    private var view: HslColorPickerView!
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        view = addSubviewFromNib() as! HslColorPickerView
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        view = addSubviewFromNib() as! HslColorPickerView
    }
    
    public convenience init() {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        
        view = addSubviewFromNib() as! HslColorPickerView
    }


    // MARK:    Overrides...
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        view.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        view.backgroundColor = backgroundColor
        view.applyBorder(cornerSize: .medium, width: .medium, color: .black)
        
        selectColor(selectedColor)
    }
    
    
    // MARK:    Methods...
    
    private func selectColor(_ color: UIColor) {
        if let hsl = color.hsl {
            view.huePicker.selectRow(hsl.hue.degrees, inComponent: 0, animated: animateSelection)
            view.saturationPicker.selectRow(hsl.saturation.percent, inComponent: 0, animated: animateSelection)
            view.brightnessPicker.selectRow(hsl.brightness.percent, inComponent: 0, animated: animateSelection)
        }
    }
    
    
    // MARK:    'UIPickerDatasource'...
    
    open func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    open func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == view.huePicker {
            return 360
        }
        else {
            return 101
        }
    }
    
    
    // MARK:    'UIPickerDelegate'...
    
    open func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == view.huePicker {
            return "\(row + 1)º"
        }
        else {
            return "\(row)"
        }
    }
    
    open func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let hue = Float(degrees: view.huePicker.selectedRow(inComponent: 0))
        let saturation = Float(percent: view.saturationPicker.selectedRow(inComponent: 0))
        let brightness = Float(percent: view.brightnessPicker.selectedRow(inComponent: 0))
        
        selectedColor = UIColor(hue: hue.cgfloat, saturation: saturation.cgfloat, brightness: brightness.cgfloat, alpha: 1.0)
        
        sendActions(for: .valueChanged)
    }
}
