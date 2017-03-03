//
//  UInt8Extensions.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import Foundation


public extension UInt8 {
    
    /**
     *Hexadecimal* representation.
    */
    public var hex: String {
        return String(format:"%02X", self)
    }
    
    /**
     Rotates the value by half-maximum.
    */
    public var flip: UInt8 {
        var opposite: Int = Int(self) + 127
        if opposite > 255 {
            opposite -= 255
        }
        
        return UInt8(opposite)
    }
}
