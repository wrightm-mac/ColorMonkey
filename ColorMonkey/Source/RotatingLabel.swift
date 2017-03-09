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
open class RotatingLabel: UILabel {

    // MARK:    Inspectables...
    
    @IBInspectable open var orientation: LabelOrientation = .rotate270
    
    @IBInspectable open var showLine: Bool = true
    
    
    // MARK:    Fields...
    
    private var preservedFrame: CGRect? = nil
    
    private var lineView: UIView? = nil
    
    
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
        
        // Kludge to stop the label resizing...
        preservedFrame = frame
        
        if showLine {
            lineView = UIView()
            lineView!.backgroundColor = textColor
            addSubview(lineView!)
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        switch orientation {
            case .none: transform = CGAffineTransform(rotationAngle: 0)
            case .rotate90: transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            case .rotate180: transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            case .rotate270: transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        }
        
        // Kludge to stop the label resizing...
        if let preservedFrame = preservedFrame {
            frame = CGRect(x: preservedFrame.origin.x, y: preservedFrame.origin.y, width: preservedFrame.width, height: preservedFrame.height)
        }
        
        if let lineView = lineView {
            lineView.frame = CGRect(x: 0.0, y: frame.width - 2.0, width: frame.height, height: 1.0)
        }
    }
}
