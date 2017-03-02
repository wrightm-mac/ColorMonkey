//
//  ViewController.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, ColorPaletteDelegate {

    @IBOutlet weak var colorPicker: ColorPicker!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var complementView: UIView!
    @IBOutlet weak var colorPalette: ColorPalette!
    
    
    // MARK:    Overrides...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorPicker.selectedColor = UIColor.create(red: 0x6D, green: 0x9B, blue: 0xc3)
        colorPalette.delegate = self
        show(color: colorPicker.selectedColor)
    }
    
    
    // MARK:    Methods...
    
    private func show(color: UIColor) {
        color.debugPrint()
        
        colorView.backgroundColor = color
        complementView.backgroundColor = color.complement
        complementView.backgroundColor = color.adjacent
        
        colorPicker.selectedColor = color
        colorPalette.colors = color.saturationVariations
    }
    
    
    // MARK:    'ColorPaletteDelegate'...
    
    func colorPalette(_ colorPalette: ColorPalette, selectedColor: UIColor) {
        show(color: selectedColor)
    }
    
    // MARK:    Events...
    
    @IBAction func colorValueChanged(_ sender: ColorPicker) {
        show(color: sender.selectedColor)
    }
}

