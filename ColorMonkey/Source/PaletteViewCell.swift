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
    
    var colorPalette: ColorPalette? = nil
    
    
    // MARK:    Overrides...
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let colorPalette = colorPalette else {
            return
        }
        
        colorPalette.frame = CGRect(x: 0.0, y: 0.0, width: frame.width, height: frame.height)
        colorPalette.scrollDirection = .horizontal
        colorPalette.cellSize = CGSize(width: 70.0, height: 70.0)
        
        
        
        removeSubviews()
        addSubview(colorPalette)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
