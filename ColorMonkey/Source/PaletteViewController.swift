//
//  PaletteViewController.swift
//  ColorMonkey
//
//  Created by Michael Wright on 10/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class PaletteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ColorPaletteDelegate {

    // MARK:    Fields...
    
    var color: UIColor? = nil {
        didSet {
            print("PaletteViewController.\(#function) color=\(String(describing: color?.rgb))")
        }
    }
    
    let sections: [PaletteViewCellType] = [
        .hue,
        .saturation,
        .brightness,
        .standard
    ]
    
    
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
        if let destination = segue.destination as? MainViewController, let color = sender as? UIColor {
            destination.show(color: color)
        }
    }
    
    
    // MARK:    'UITableViewDataSource'...
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaletteCell", for: indexPath) as! PaletteViewCell
        
        let paletteType = sections[indexPath.section]
        let palette = paletteType.view

        if var variationPalette = palette as? ColorPaletteVariation {
             variationPalette.color = color
        }
        
        palette.delegate = self
        cell.colorPalette = palette
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 31.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerLabel = BubbleLabel()
        headerLabel.text = sections[section].rawValue
        
        return headerLabel
    }
    
    
    // MARK:    'UITableViewDelegate'...
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].size.cgfloat
    }
    
    
    // MARK:    'ColorPaletteDelegate'...
    
    func colorPalette(_ colorPalette: ColorPalette, selectedColor: UIColor) {
        performSegue(withIdentifier: "UnwindToMain", sender: selectedColor)
    }
}
