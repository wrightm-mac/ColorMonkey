//
//  CGFloatExtensions.swift
//  ColorMonkey
//
//  Created by Michael Wright on 01/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import Foundation
import UIKit


public extension CGFloat {
    
    // MARK:    Initialisers...
    
    public init(degrees: Int) {
        self = CGFloat(1.0 / 360.0 * Float(degrees))
    }
    
    public init(percent: Int) {
        self = CGFloat(1.0 / 100.0 * Float(percent))
    }
    
    
    // MARK:    Conversions...
    
    public var float: Float {
        return Float(self)
    }
}
