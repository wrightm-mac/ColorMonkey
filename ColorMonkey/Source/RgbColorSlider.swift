//
//  RgbColorSlider.swift
//  ColorMonkey
//
//  Created by Michael Wright on 06/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


@IBDesignable
open class RgbColorSlider: UIControl {
    
    // MARK:    Inspectables...
    
    @IBInspectable open var selectedColor: UIColor = .black {
        didSet {
            selectColor(selectedColor)
        }
    }
    

    // MARK:    Fields...
    
    private weak var view: RgbColorSliderView!
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        view = addSubviewFromNib() as! RgbColorSliderView
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        view = addSubviewFromNib() as! RgbColorSliderView
    }
    
    public convenience init() {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        
        view = addSubviewFromNib() as! RgbColorSliderView
    }

    
    // MARK:    Overrides...
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        view.parent = self
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    // MARK:    Methods...
    
    internal func sliderValueChanged(_ values: (red: UInt8, green: UInt8, blue: UInt8)) {
        print("RgbColorSlider.\(#function) - values=\(values)")
        
        selectedColor = UIColor(forRed: values.red, green: values.green, blue: values.blue)
        
        sendActions(for: .valueChanged)
    }
    
    private func selectColor(_ color: UIColor) {
        if let rgb = color.rgb {
            view.redSlider.value = Float(rgb.red)
            view.greenSlider.value = Float(rgb.green)
            view.blueSlider.value = Float(rgb.blue)
        }
    }
}
