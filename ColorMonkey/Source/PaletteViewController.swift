//
//  PaletteViewController.swift
//  ColorMonkey
//
//  Created by Michael Wright on 10/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class PaletteViewController: UIViewController, UITableViewDataSource, UITabBarDelegate {

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
    
    
    // MARK:    'UITableViewDataSource'...

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaletteCell", for: indexPath)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    
    // MARK:    'UITableViewDelegate'...
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("PaletteViewController.\(#function)")
    }
}