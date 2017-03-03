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
    
    public var cgfloat: CGFloat {
        return CGFloat(self)
    }
    
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
