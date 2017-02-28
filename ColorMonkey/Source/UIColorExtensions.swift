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
}
