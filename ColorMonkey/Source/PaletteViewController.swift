//
//  PaletteViewController.swift
//  ColorMonkey
//
//  Created by Michael Wright on 10/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class PaletteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK:    Fields...
    
    var color: UIColor? = nil {
        didSet {
            print("PaletteViewController.\(#function) color=\(color?.rgb)")
        }
    }
    
    let sections: [PaletteViewCellType] = [
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
        print("PaletteViewController.\(#function)")
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].rawValue
    }
    
    
    // MARK:    'UITableViewDelegate'...
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].size.cgfloat
    }
}
