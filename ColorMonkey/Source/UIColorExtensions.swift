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
    
    public var rgbFloat: (red: Float, green: Float, blue: Float, alpha: Float)? {
        var red : CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        var alpha: CGFloat = 0
        
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return (red.float, green.float, blue.float, alpha.float)
        }
        else {
            return nil
        }
    }
    
    public var rgb: (red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8)? {
        var red : CGFloat = 0
        var green : CGFloat = 0
        var blue : CGFloat = 0
        var alpha: CGFloat = 0
        
        if getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return (UInt8(red * 255.0), UInt8(green * 255.0), UInt8(blue * 255.0), UInt8(alpha * 255.0))
        }
        else {
            return nil
        }
    }
    
    public var hex: String? {
        if let rgb = rgb {
            return "(\(rgb.red.hex, rgb.green.hex, rgb.blue.hex))"
        }
        else {
            return nil
        }
    }
    
    public var hexString: String? {
        if let rgb = rgb {
            return "\(rgb.red.hex) \(rgb.green.hex) \(rgb.blue.hex)"
        }
        else {
            return nil
        }
    }
    
    public var hsl: (hue: Float, saturation: Float, brightness: Float, alpha: Float)? {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return (hue.float, saturation.float, brightness.float, alpha.float)
        }
        else {
            return nil
        }
    }
    
    public var complement: UIColor? {
        if let hsl = hsl {
            var opposite = hsl.hue + 0.5
            if opposite > 1.0 {
                opposite -= 1.0
            }
            
            return UIColor(hue: opposite.cgfloat, saturation: hsl.saturation.cgfloat, brightness: hsl.brightness.cgfloat, alpha: hsl.alpha.cgfloat)
        }
        
        return nil
    }
    
    public var adjacent: UIColor? {
        if let rgb = rgb {
            return UIColor.create(red: rgb.red, green: rgb.green.flip, blue: rgb.blue, alpha: rgb.alpha)
        }
        
        return nil
    }
    
    public func debugPrint() {
        print()
        print("😮 \(#function) color      rgb=#\(self.hexString!)    hsl=\(self.hsl!)")
        print("😮 \(#function) complement rgb=#\(complement!.hexString!)    hsl=\(complement!.hsl!)")
        print("😮 \(#function) adjacent   rgb=#\(adjacent!.hexString!)    hsl=\(adjacent!.hsl!)")
    }
}
