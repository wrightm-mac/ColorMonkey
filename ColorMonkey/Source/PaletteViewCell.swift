//
//  PaletteViewCell.swift
//  ColorMonkey
//
//  Created by Michael Wright on 13/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class PaletteViewCell: UITableViewCell {

    // MARK:    Fields...
    
    var view: UIView? = nil
    
    
    // MARK:    Overrides...
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let view = view else {
            return
        }
        
        view.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        
        removeSubviews()
        addSubview(view)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
