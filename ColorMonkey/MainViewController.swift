//
//  ViewController.swift
//  ColorMonkey
//
//  Created by Michael Wright on 28/02/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {

    @IBOutlet weak var colorPicker: ColorPicker!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var complementView: UIView!
    
    
    // MARK:    Overrides...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        show(color: colorPicker.selectedColor)
    }
    
    
    // MARK:    Methods...
    
    private func show(color: UIColor) {
        print("\(#function) color -      rgb=\(color.hex!) hsl=\(color.hsl!)")
        
        colorView.backgroundColor = color
        
        let complement = color.complement!
        print("\(#function) complement - rgb=\(complement.hex!) hsl=\(complement.hsl!)")
        complementView.backgroundColor = complement
    }
    
    
    // MARK:    Events...
    
    @IBAction func colorValueChanged(_ sender: ColorPicker) {
        show(color: sender.selectedColor)
    }
}

