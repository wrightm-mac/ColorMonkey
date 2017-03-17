//
//  HslColorSlider.swift
//  ColorMonkey
//
//  Created by Michael Wright on 07/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit

@IBDesignable
open class HslColorSlider: UIControl {
    
    // MARK:    Inspectables...
    
    @IBInspectable open var selectedColor: UIColor = .black {
        didSet {
            setColor(selectedColor)
        }
    }
    
    
    // MARK:    Fields...
    
    private weak var view: HslColorSliderView!
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        view = addSubviewFromNib() as! HslColorSliderView
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        view = addSubviewFromNib() as! HslColorSliderView
    }
    
    public init() {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        
        view = addSubviewFromNib() as! HslColorSliderView
    }
    
    
    // MARK:    Overrides...
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        view.parent = self
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        setColor(selectedColor)
    }
    
    
    // MARK:    Methods...
    
    internal func sliderValueChanged(hue: Int, saturation: Int, brightness: Int) {
        selectedColor = UIColor(hue: CGFloat(degrees: hue), saturation: CGFloat(percent: saturation), brightness: CGFloat(percent: brightness), alpha: 1.0)
        
        sendActions(for: .valueChanged)
    }
    
    open func setColor(_ color: UIColor) {
        if let hsl = color.hsl {
            view.hueSlider.value = Float(hsl.hue.degrees)
            view.saturationSlider.value = Float(hsl.saturation.percent)
            view.brightnessSlider.value = Float(hsl.brightness.percent)
        }
    }
}
