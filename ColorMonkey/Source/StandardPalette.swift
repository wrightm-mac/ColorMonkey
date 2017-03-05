//
//  StandardPalette.swift
//  ColorMonkey
//
//  Created by Michael Wright on 05/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


@IBDesignable
open class StandardPalette: ColorPalette {
    
    // MARK:    Inspectables...
    
    @IBInspectable open var stepCount: Int = 32 {
        didSet {
            reloadData()
        }
    }
    
    @IBInspectable open var saturation: Int = 99 {
        didSet {
            reloadData()
        }
    }
    
    @IBInspectable open var brightness: Int = 99 {
        didSet {
            reloadData()
        }
    }
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        createColors()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        createColors()
    }
    
    public convenience init() {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        
        createColors()
    }
    

    // MARK:    Overrides...
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        print("StandardPalette.\(#function)")
    }
    
    
    // MARK:    Methods...
    
    private func createColors() {
        var newColors = [UIColor]()
        
        let stepIncrement: Float = 1.0 / Float(stepCount)
        let colorSaturation = CGFloat(percent: saturation)
        let colorBrightness = CGFloat(percent: brightness)
        
        var step: Float = 0.001
        for _ in 0..<stepCount {
            let color = UIColor(hue: step.cgfloat, saturation: colorSaturation, brightness: colorBrightness, alpha: 1.0)
            newColors.append(color)
            
            step += stepIncrement
        }
        
        colors = newColors
    }
}
