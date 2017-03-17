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
open class RotatingLabel: UIControl {

    // MARK:    Inspectables...
    
    @IBInspectable open var orientation: LabelOrientation = .rotate270
    
    @IBInspectable open var text: String? = nil
    
    @IBInspectable open var showLine: Bool = true
    
    
    // MARK:    Fields...
    
    //private var preservedFrame: CGRect? = nil
    
    private var label: UILabel = UILabel()
    
    private var lineView: UIView? = nil
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public init() {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
    }
    
    
    // MARK:    Overrides...
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        label.textAlignment = .left
        addSubview(label)
        
        if showLine {
            lineView = UIView()
            lineView!.backgroundColor = .black
            addSubview(lineView!)
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        switch orientation {
            case .none: label.transform = CGAffineTransform(rotationAngle: 0)
            case .rotate90: label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
            case .rotate180: label.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
            case .rotate270: label.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        }
        
        label.text = text
        label.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        
        if let lineView = lineView {
            lineView.frame = CGRect(x: frame.width - 2.0, y: 0.0, width: 1.0, height: frame.height)
        }
    }
}
