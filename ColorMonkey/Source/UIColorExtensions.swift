//
//  UIColorExtensions.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import Foundation
import UIKit


extension UIColor {
    
    // MARK:    Initialisers...
    
    /**
     Instantiates a `UIColor` object based on an *RGB* value.
     
     The `color` passed in is assumed to be a *hexadecimal* value. It is parsed
     as: `AARRGGBB`.
     
     If the Alpha part is `0x00`, it is set to `0xFF`. This allows simple colors
     to be created without always having to specify the Alpha.
     
     - parameter color:  The **RGB** of the color to be created.
     - returns: A new color.
     */
    public convenience init(color: UInt32) {
        let red: UInt8 = UInt8((color >> 16) & 0xFF)
        let green: UInt8 = UInt8((color >> 8) & 0xFF)
        let blue: UInt8 = UInt8(color & 0xFF)
        let alpha: UInt8 = UInt8((color >> 24) & 0xFF)
    
        self.init(forRed: red, green: green, blue: blue, alpha: (alpha == 0x00) ? 0xFF : alpha)
    }
    
    /**
     Instantiates a `UIColor` object based on an *RGB* value.
     
     - parameter red:  Red component.
     - parameter green:  Green component.
     - parameter blue:  Blue component.
     - parameter alpha:  Alpha component (optional - defaults to `0xFF`).
     - returns: A new color.
     */
    public convenience init(forRed: UInt8, green: UInt8, blue: UInt8, alpha: UInt8 = 255) {
        self.init(red: CGFloat(Float(forRed) / 255.0),
                       green: CGFloat(Float(green) / 255.0),
                       blue: CGFloat(Float(blue) / 255.0),
                       alpha: CGFloat(Float(alpha) / 255.0))
    }
    
    
    // MARK:    RGB...
    
    /**
     The components of the color, as floating point values between `0.0` and `1.0`.
     
     A tuple of the form `(red, green, blue, alpha)`.
     */
    public var rgbFloat: (red: Float, green: Float, blue: Float, alpha: Float)? {
        var red : CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        var alpha: CGFloat = 0
        
        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }

        return (red.float, green.float, blue.float, alpha.float)
    }
    
    /**
     The components of the color.
     
     A tuple of the form `(red, green, blue, alpha)`.
     */
    public var rgb: (red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8)? {
        var red : CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        var alpha: CGFloat = 0
        
        guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return nil
        }

        return (UInt8(red * 255.0), UInt8(green * 255.0), UInt8(blue * 255.0), UInt8(alpha * 255.0))
    }
    
    /**
        Components of the color, represented as a tuple.
     
        The *Alpha* component is not included.
    */
    public var hex: String? {
        guard let rgb = rgb else {
            return nil
        }
        
        return "(\(rgb.red.hex, rgb.green.hex, rgb.blue.hex))"
    }
    
    /**
     Components of the color, as a *hex* string.
     
     The *alpha* component is not included.
    */
    public var hexString: String? {
        guard let rgb = rgb else {
            return nil
        }

        return "\(rgb.red.hex)\(rgb.green.hex)\(rgb.blue.hex)"
    }
    
    /**
     The **HSL* attributes of the color.
     
     A tuple of the form `(hue, saturation, brightness, alpha)`. All values in the
     tuple are between `0.0` and `1.0`.
    */
    public var hsl: (hue: Float, saturation: Float, brightness: Float, alpha: Float)? {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        guard getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) else {
            return nil
        }

        return (hue.float, saturation.float, brightness.float, alpha.float)
    }
    
    /**
        The **HSL** complement of the color.
    */
    public var complement: UIColor? {
        guard let hsl = hsl else {
            return nil
        }

        var opposite = hsl.hue + 0.5
        if opposite > 1.0 {
            opposite -= 1.0
        }
        
        return UIColor(hue: opposite.cgfloat, saturation: hsl.saturation.cgfloat, brightness: hsl.brightness.cgfloat, alpha: hsl.alpha.cgfloat)
    }
    
    /**
     The **HSL** adjacent color.
    */
    public var adjacent: UIColor? {
        guard let rgb = rgb else {
            return nil
        }
        
        return UIColor(forRed: rgb.red, green: rgb.green.flip, blue: rgb.blue, alpha: rgb.alpha)
    }
    
    public var hueRange: [UIColor]? {
        let numberOfSteps = 36.0
        let stepIncrement = 1.0 / numberOfSteps
        
        guard let hsl = hsl else {
            return nil
        }
        
        var variations = [UIColor]()
        
        var hueStep = 0.9999
        while hueStep >= 0.0 {
            let hueColor = UIColor(hue: hueStep.cgfloat, saturation: hsl.saturation.cgfloat, brightness: hsl.brightness.cgfloat, alpha: hsl.alpha.cgfloat)
            variations.append(hueColor)
            hueStep -= stepIncrement
            
        }
        
        return variations
    }
    
    /**
        Array of saturations for the color.
    */
    public var saturationRange: [UIColor]? {
        let numberOfSteps = 24.0
        let stepIncrement = 1.0 / numberOfSteps
        
        guard let hsl = hsl else {
            return nil
        }
        
        var variations = [UIColor]()
        
        var saturationStep = 0.9999
        while saturationStep >= 0.0 {
            let saturationColor = UIColor(hue: hsl.hue.cgfloat, saturation: saturationStep.cgfloat, brightness: hsl.brightness.cgfloat, alpha: hsl.alpha.cgfloat)
            variations.append(saturationColor)
            saturationStep -= stepIncrement
            
        }
        
        return variations
    }
    
    /**
     Array of varying brightness for the color.
    */
    public var brightnessRange: [UIColor]? {
        let numberOfSteps = 24.0
        let stepIncrement = 1.0 / numberOfSteps
        
        guard let hsl = hsl else {
            return nil
        }
        
        var variations = [UIColor]()
        
        var brightnessStep = 0.9999
        while brightnessStep >= 0.0 {
            let brightnessColor = UIColor(hue: hsl.hue.cgfloat, saturation: hsl.saturation.cgfloat, brightness: brightnessStep.cgfloat, alpha: hsl.alpha.cgfloat)
            variations.append(brightnessColor)
            brightnessStep -= stepIncrement
            
        }
        
        return variations
    }
    
    public func debugPrint() {
        print("😮 UIColor rgb=#\(hexString!) hsl=(\(hsl!.hue.degrees)º,\(hsl!.saturation.percent)%,\(hsl!.brightness.percent)%)")
    }
}
