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
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var complementButton: UIButton!
    
    // MARK:    Overrides...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorButton.applyBorder(cornerSize: .small, width: .thick, color: .black)
        complementButton.applyBorder(cornerSize: .small, width: .thick, color: .black)
        
        show(color: UIColor(forRed: 0x14, green: 0xCB, blue: 0xCB))
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    
    // MARK:    Methods...
    
    private func show(color: UIColor) {
        color.debugPrint()
        
        colorButton.backgroundColor = color
        complementButton.backgroundColor = color.complement
        
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
    
    @IBAction func colorTouchUpInside(_ sender: UIButton) {
        print("MainViewController.\(#function)")
    }
    
    @IBAction func complementTouchUpInside(_ sender: UIButton) {
        if let color = sender.backgroundColor {
            show(color: color)
        }
    }
}
