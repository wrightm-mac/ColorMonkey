//
//  BubbleLabel.swift
//  ColorMonkey
//
//  Created by Michael Wright on 13/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


@IBDesignable
open class BubbleLabel: UIView {

    // MARK:    Inspectables...
    
    @IBInspectable open var text: String? = nil
    
    @IBInspectable open var borderColor: UIColor = .gray
    
    @IBInspectable open var textColor: UIColor = .gray
    
    
    // MARK:    Fields...
    
    private weak var view: BubbleLabelView!
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        view = addSubviewFromNib() as! BubbleLabelView
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        view = addSubviewFromNib() as! BubbleLabelView
    }
    
    public convenience init() {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        
        view = addSubviewFromNib() as! BubbleLabelView
    }
    

    // MARK:    Overrides...
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        view.borderView.applyBorder(cornerSize: .large, width: .medium, color: borderColor)
        
        view.textLabel.text = text
        view.textLabel.textColor = textColor
    }
}
