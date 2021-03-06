//
//  ColorPalette.swift
//  ColorMonkey
//
//  Created by Michael Wright on 01/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


@IBDesignable
open class ColorPalette: UIControl, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK:    Inspectables...
    
    @IBInspectable open var colors: [UIColor]? = [UIColor]() {
        didSet {
            reloadData()
        }
    }
    
    @IBInspectable open var cellSize: CGSize = CGSize(width: 60.0, height: 60.0)
    
    @IBInspectable open var scrollDirection: UICollectionViewScrollDirection = .vertical
    
    @IBInspectable open var delegate: ColorPaletteDelegate? = nil
    
    
    // MARK:    Fields...
    
    private var view: ColorPaletteView!
    
    
    // MARK:    Initialisers...
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        view = addSubviewFromNib("ColorPalette") as! ColorPaletteView
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        view = addSubviewFromNib("ColorPalette") as! ColorPaletteView
    }
    
    public init() {
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 10.0))
        
        view = addSubviewFromNib("ColorPalette") as! ColorPaletteView
    }
    
    
    // MARK:    Overrides...
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        view.register(getNib("ColorPaletteCell"), forCellWithReuseIdentifier: "PaletteCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = scrollDirection
        
        flowLayout.sectionInset = UIEdgeInsetsMake(3.0, 4.0, 7.0, 6.0)
        
        view.collectionViewLayout = flowLayout
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

    
    // MARK:    Methods...
    
    open func reloadData() {
        view.reloadData()
    }
    
    
    // MARK:    'UICollectionViewDelegate'...
    
    open func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        print("😮 ColorPalette.\(#function)")
        
        return true
    }
    
    open func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        print("😮 ColorPalette.\(#function)")

        return true
    }
    
    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("😮 ColorPalette.\(#function)")
        
        if let delegate = delegate, let color = colors?[indexPath.row] {
            delegate.colorPalette?(self, selectedColor: color)
        }
    }
    
    open func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("😮 ColorPalette.\(#function)")
    }
    
    
    // MARK:    'UICollectionViewDelegateFlowLayout'...
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
}
