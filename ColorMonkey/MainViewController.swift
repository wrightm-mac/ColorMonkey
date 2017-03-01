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
    
    
    // MARK:    Overrides...
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.backgroundColor = colorPicker.selectedColor
    }
    
    
    // MARK:    Events...
    
    @IBAction func colorValueChanged(_ sender: ColorPicker) {
        print("\(#function) selectedColor - rgb=\(sender.selectedColor.rgb!) hsl=\(sender.selectedColor.hsl!)")
        
        colorView.backgroundColor = sender.selectedColor
    }
}

