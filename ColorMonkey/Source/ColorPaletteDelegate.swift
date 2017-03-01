//
//  ColorPaletteDelegate.swift
//  ColorMonkey
//
//  Created by Michael Wright on 01/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import Foundation
import UIKit


@objc public protocol ColorPaletteDelegate: NSObjectProtocol {
    
    @objc optional func colorPalette(_ colorPalette: ColorPalette, selectedColor: UIColor)
}
