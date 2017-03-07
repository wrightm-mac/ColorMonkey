//
//  RotatingLabel.swift
//  ColorMonkey
//
//  Created by Michael Wright on 07/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


public enum LabelOrientation {
    case none
    case rotate90
    case rotate180
    case rotate270
}


@IBDesignable
open class RotatingLabel: UIView {

    // MARK:    Inspectables...
    
    @IBInspectable open var orientation: LabelOrientation = .rotate270
    
    @IBInspectable open var text: String? = nil
    
    
    // MARK:    Fields...
    
    private var label: UILabel = UILabel()
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init() {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
    }
    
    
    // MARK:    Overrides...
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        label.numberOfLines = 0
        addSubview(label)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        label.text = text
        label.debug(.yellow)
        label.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        
        switch orientation {
            case .none: label.transform = CGAffineTransform(rotationAngle: 0)
            case .rotate90: label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            case .rotate180: label.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            case .rotate270: label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        }
    }
}
