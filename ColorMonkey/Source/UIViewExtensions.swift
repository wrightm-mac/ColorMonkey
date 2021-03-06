//
//  UIViewExtensions.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//


import Foundation
import UIKit


public extension UIView {

    // MARK:    View management...
    
    public func removeSubviews() {
        subviews.forEach { view in view.removeFromSuperview() }
    }

    
    // MARK:    Nib...
    
    public func getNib(_ nibName: String? = nil) -> UINib {
        let name = nibName ?? String(describing: type(of: self))
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: name, bundle: bundle)
        
        return nib
    }
    
    public func loadViewFromNib(_ nibName: String? = nil) -> UIView {
        return loadFromNib(nibName)
    }
    
    public func loadFromNib<T>(_ nibName: String? = nil) -> T {
        let nibObjects = getNib(nibName).instantiate(withOwner: self, options: nil)
        let nibContents = nibObjects[0] as! T
        
        return nibContents
    }
    
    public func addSubviewFromNib(_ nibName: String? = nil) -> UIView {
        let nibView = loadViewFromNib(nibName)
        
        nibView.frame = bounds
        nibView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(nibView)
        
        return nibView
    }
    
    
    // MARK:    Appearance...
    
    public enum CornerSize: Int {
        case none = 0,
        tiny = 2,
        small = 4,
        medium = 8,
        large = 12,
        massive = 20
    }
    
    public enum LineWidth: Float {
        case none = 0.0,
        veryThin = 0.1,
        thin = 0.3,
        medium = 0.6,
        thick = 1.2
    }
    
    public func debug(_ color: UIColor = .red) {
        applyBorder(width: .thick, color: color)
    }
    
    public func applyCorners(cornerSize: CornerSize = .tiny) {
        layer.cornerRadius = CGFloat(cornerSize.rawValue)
    }
    
    public func applyBorder(cornerSize: CornerSize = .tiny, width: LineWidth = .veryThin, color: UIColor = UIColor.black) {
        layer.cornerRadius = CGFloat(cornerSize.rawValue)
        layer.borderWidth = CGFloat(width.rawValue)
        layer.borderColor = color.cgColor
    }
    
    public func applyShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 5
    }
}
