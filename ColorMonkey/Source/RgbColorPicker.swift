//
//  RgbColorPicker.swift
//  ColorMonkey
//
//  Created by Michael Wright on 02/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


@IBDesignable
open class RgbColorPicker: UIControl, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK:    Inspectables...
    
    @IBInspectable open var showHexadecimal: Bool = true
    
    @IBInspectable open var selectedColor: UIColor = .black {
        didSet {
            setColor(selectedColor)
        }
    }
    
    @IBInspectable open var animateSelection: Bool = true
    
    
    // MARK:    Fields...
    
    private weak var view: RgbColorPickerView!
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        view = addSubviewFromNib() as! RgbColorPickerView
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        view = addSubviewFromNib() as! RgbColorPickerView
    }
    
    public init() {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        
        view = addSubviewFromNib() as! RgbColorPickerView
    }
    
    
    // MARK:    Overrides...
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        view.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        view.backgroundColor = backgroundColor
        view.applyBorder(cornerSize: .medium, width: .medium, color: .black)
        
        setColor(selectedColor)
    }
    
    
    // MARK:    Methods...
    
    open func setColor(_ color: UIColor) {
        if let rgb = color.rgb {
            view.redPicker.selectRow(Int(rgb.red), inComponent: 0, animated: animateSelection)
            view.greenPicker.selectRow(Int(rgb.green), inComponent: 0, animated: animateSelection)
            view.bluePicker.selectRow(Int(rgb.blue), inComponent: 0, animated: animateSelection)
        }
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
    
    open func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedColor = UIColor(forRed: UInt8(view.redPicker.selectedRow(inComponent: 0)),
                                       green: UInt8(view.greenPicker.selectedRow(inComponent: 0)),
                                       blue: UInt8(view.bluePicker.selectedRow(inComponent: 0)))
        
        sendActions(for: .valueChanged)
    }
}
