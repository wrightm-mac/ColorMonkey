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
    
    public init(degrees: Int) {
        self = Float(1.0 / 360.0 * Float(degrees))
    }
    
    public init(percent: Int) {
        self = Float(1.0 / 100.0 * Float(percent))
    }

    
    // MARK:    CGFloat...
    
    public var cgfloat: CGFloat {
        return CGFloat(self)
    }
    
    
    // MARK:    Percent & degrees...
    
    public var percent: Int {
        get {
            return Int((100.0 * self).rounded())
        }
        set {
            self = 1.0 / 100.0 * Float(newValue)
        }
    }
    
    public var degrees: Int {
        get {
            return Int((360.0 * self).rounded())
        }
        set {
            self = 1.0 / 360.0 * Float(newValue)
        }
    }
}
