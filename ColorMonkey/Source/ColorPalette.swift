//
//  ColorPalette.swift
//  ColorMonkey
//
//  Created by Michael Wright on 01/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


@IBDesignable
open class ColorPalette: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK:    Inspectables...
    
    @IBInspectable open var colors: [UIColor]? = [UIColor]() {
        didSet {
            view.reloadData()
        }
    }
    
    @IBInspectable open var cellSize: CGSize = CGSize(width: 60.0, height: 60.0)
    
    
    // MARK:    Fields...
    
    private var view: ColorPaletteView!
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        view = addSubviewFromNib() as! ColorPaletteView
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        view = addSubviewFromNib() as! ColorPaletteView
    }
    
    public convenience init() {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        
        view = addSubviewFromNib() as! ColorPaletteView
    }
    
    
    // MARK:    Overrides...
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        view.debug(.purple)
        
        view.register(getNib("ColorPaletteCell"), forCellWithReuseIdentifier: "PaletteCell")
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    // MARK:    'UICollectionViewDataSource'...
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors?.count ?? 0
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PaletteCell", for: indexPath) as! ColorPaletteCellView
        
        if let color = colors?[indexPath.row] {
            cell.backgroundColor = color
        }
        
        return cell
    }

    
    // MARK:    'UICollectionViewDelegate'...
    
    
    
    // MARK:    'UICollectionViewDelegateFlowLayout'...
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
}
