//
//  ColorPaletteCellView.swift
//  ColorMonkey
//
//  Created by Michael Wright on 01/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class ColorPaletteCellView: UICollectionViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        applyBorder(cornerSize: .medium)
    }
}
