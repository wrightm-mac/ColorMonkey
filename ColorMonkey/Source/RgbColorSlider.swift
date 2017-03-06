//
//  RgbColorSlider.swift
//  ColorMonkey
//
//  Created by Michael Wright on 06/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


@IBDesignable
open class RgbColorSlider: UIView {

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
    
    func sliderValueChanged(_ values: (red: UInt8, green: UInt8, blue: UInt8)) {
        print("RgbColorSlider.\(#function) - values=\(values)")
    }
}
