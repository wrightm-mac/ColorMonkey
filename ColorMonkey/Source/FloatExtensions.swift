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
            return Int(self * 100.0)
        }
        set {
            self = Float(newValue) / 100.0
        }
    }
    
    public var degrees: Int {
        get {
            if self == 0.0 {
                return 0
            }
            else {
                let degree: Float = (1.0 / 360.0)
                let result = degree * self
                
                return Int(result * 100000.0)
            }
        }
        set {
            let degree: Float = (1.0 / 360.0)
            let amount: Float = Float(newValue) / 100000.0
            
            self = degree * amount
        }
    }
}
