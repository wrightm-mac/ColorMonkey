//
//  PaletteViewCellType.swift
//  ColorMonkey
//
//  Created by Michael Wright on 13/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//


import Foundation
import UIKit


public enum PaletteViewCellSize {
    
    case small
    case medium
    case large
    
    public var cgfloat: CGFloat {
        switch self {
        case .small: return 80
        case .medium: return 160
        case .large: return 240
        }
    }
}

public enum PaletteViewCellType: String {
    
    case saturation = "Saturation"
    case brightness = "Brightness"
    case standard = "Standard"
    
    public var size: PaletteViewCellSize {
        switch self {
            case .saturation: return .small
            case .brightness: return .medium
            case .standard: return .large
        }
    }
    
    public var view: UIView {
        switch self {
            case .saturation: return StandardPalette()
            case .brightness: return StandardPalette()
            case .standard: return StandardPalette()
        }
    }
}
