//
//  BrightnessPalette.swift
//  ColorMonkey
//
//  Created by Michael Wright on 13/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import Foundation
import UIKit


@IBDesignable
open class BrightnessPalette: ColorPalette {
    
    // MARK:    Inspectables...
    
    @IBInspectable open var color: UIColor? = nil
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init() {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
    }
    
    
    // MARK:    Overrides...
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        colors = color?.brightnessRange
    }
}
