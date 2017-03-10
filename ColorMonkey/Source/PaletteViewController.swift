//
//  PaletteViewController.swift
//  ColorMonkey
//
//  Created by Michael Wright on 10/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class PaletteViewController: UIViewController {

    // MARK:    Fields...
    
    var color: UIColor? = nil {
        didSet {
            print("PaletteViewController.\(#function) color=\(color?.rgb)")
        }
    }
    
    
    // MARK:    Initialisers & deinitialisers...
    
    deinit {
        print("PaletteViewController.\(#function)")
    }
    
    
    // MARK:    Overrides...
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    // MARK:    Navigation...

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
