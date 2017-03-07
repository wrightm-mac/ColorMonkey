//
//  ViewController.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, ColorPaletteDelegate {

    @IBOutlet weak var rgbPicker: RgbColorPicker!
    @IBOutlet weak var hslPicker: HslColorPicker!
    @IBOutlet weak var rgbSlider: RgbColorSlider!
    @IBOutlet weak var hslSlider: HslColorSlider!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var complementView: UIView!

    
    // MARK:    Overrides...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.applyBorder(cornerSize: .small, width: .thick, color: .black)
        complementView.applyBorder(cornerSize: .small, width: .thick, color: .black)
        
        show(color: UIColor(forRed: 0x6D, green: 0x9B, blue: 0xc3))
    }
    
    
    // MARK:    Methods...
    
    private func show(color: UIColor) {
        color.debugPrint()
        
        colorView.backgroundColor = color
        complementView.backgroundColor = color.complement
        
        rgbPicker.selectedColor = color
        hslPicker.selectedColor = color
        rgbSlider.selectedColor = color
        hslSlider.selectedColor = color
        
        rgbSlider.selectedColor = color
    }
    
    
    // MARK:    Events...
    
    @IBAction func rgbValueChanged(_ sender: RgbColorPicker) {
        show(color: sender.selectedColor)
    }
    
    @IBAction func hslValueChanged(_ sender: HslColorPicker) {
        show(color: sender.selectedColor)
    }
    
    @IBAction func rgbSliderValueChanged(_ sender: RgbColorSlider) {
        show(color: sender.selectedColor)
    }
    
    @IBAction func hslSliderValueChanged(_ sender: HslColorSlider) {
        show(color: sender.selectedColor)
    }
}
