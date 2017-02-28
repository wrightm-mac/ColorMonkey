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
    
    // MARK:    RGB...
    
    public static func create(color: UInt32) -> UIColor {
        let red: UInt8 = UInt8((color >> 16) & 0xFF)
        let green: UInt8 = UInt8((color >> 8) & 0xFF)
        let blue: UInt8 = UInt8(color & 0xFF)
        let alpha: UInt8 = UInt8((color >> 24) & 0xFF)
        
        return create(red: red, green: green, blue: blue, alpha: (alpha == 0x00) ? 0xFF : alpha)
    }
    
    
    public static func create(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8 = 255) -> UIColor {
        return UIColor(red: CGFloat(Float(red) / 255.0),
                       green: CGFloat(Float(green) / 255.0),
                       blue: CGFloat(Float(blue) / 255.0),
                       alpha: CGFloat(Float(alpha) / 255.0))
    }
    
    public var cgfloat: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)? {
        var red : CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        var alpha: CGFloat = 0
        
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return (red: red, green: green, blue: blue, alpha: alpha)
        }
        else {
            return nil
        }
    }
    
    public var uint8: (red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8)? {
        var red : CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        var alpha: CGFloat = 0
        
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return (red: UInt8(red * 255.0), green: UInt8(green * 255.0), blue: UInt8(blue * 255.0), alpha: UInt8(alpha * 255.0))
        }
        else {
            return nil
        }
    }
    
    public var hex: String? {
        if let rgb = uint8 {
            return "(\(rgb.red.hex, rgb.green.hex, rgb.blue.hex))"
        }
        else {
            return nil
        }
    }
}
