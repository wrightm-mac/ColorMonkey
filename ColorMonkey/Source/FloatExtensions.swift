//
//  FloatExtensions.swift
//  ColorMonkey
//
//  Created by Michael Wright on 01/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import Foundation
import UIKit


public extension Float {
    
    // MARK:    Initialisers...
    
    /**
     Create a `CGFloat` based on degrees. Convenience for when creating an
     **HSL** color.
     
     - parameter degrees:   Degrees on the color-wheel. Should be between
                            `0.0` (representing 1º) and `1.0` (representing 360º).
     */
    public init(degrees: Int) {
        self = Float(1.0 / 360.0 * Float(degrees))
    }
    
    /**
     Create a `CGFloat` based on percentage. Convenience for when creating an
     **HSL** color.
     
     - parameter percent:   Percentage. Should be between
                            `0.0` (representing 1%) and `1.0` (representing 100º).
     */
    public init(percent: Int) {
        self = Float(1.0 / 100.0 * Float(percent))
    }

    
    // MARK:    CGFloat...
    
    /**
     `CGFloat` representation.
    */
    public var cgfloat: CGFloat {
        return CGFloat(self)
    }
    
    
    // MARK:    Percent & degrees...
    
    /**
     Percentage representation.
     
     Value between `0` and `1'.
    */
    public var percent: Int {
        get {
            return Int((100.0 * self).rounded())
        }
        set {
            self = 1.0 / 10.0 * Float(newValue)
        }
    }
    
    /**
     Degrees representation.
     
     Value between `0.0` and `1.0`.
    */
    public var degrees: Int {
        get {
            return Int((360.0 * self).rounded())
        }
        set {
            self = 1.0 / 360.0 * Float(newValue)
        }
    }
}
