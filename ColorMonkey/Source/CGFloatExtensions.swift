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
    
    /**
        Create a `CGFloat` based on degrees. Convenience for when creating an
        **HSL** color.
     
        - parameter degrees:    Degrees on the color-wheel. Should be between
                                `0.0` (representing 1º) and `1.0` (representing
                                360º).
    */
    public init(degrees: Int) {
        self = CGFloat(1.0 / 360.0 * Float(degrees))
    }
    
    /**
     Create a `CGFloat` based on percentage. Convenience for when creating an
     **HSL** color.
     
     - parameter percent:   Percentage. Should be between
                            `0.0` (representing 1%) and `1.0` (representing 100º).
     */
    public init(percent: Int) {
        self = CGFloat(1.0 / 100.0 * Float(percent))
    }
    
    
    // MARK:    Conversions...
    
    /**
     `Float` representation.
    */
    public var float: Float {
        return Float(self)
    }
}
