//
//  UInt8Extensions.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import Foundation


public extension UInt8 {
    
    public var hex: String {
        return String(format:"%02X", self)
    }
}
