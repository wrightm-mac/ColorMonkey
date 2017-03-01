//
//  DoubleExtensions.swift
//  ColorMonkey
//
//  Created by Michael Wright on 01/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import Foundation
import UIKit


public extension Double {
    
    public var float: Float {
        return Float(self)
    }
    
    public var cgfloat: CGFloat {
        return CGFloat(self)
    }
}
