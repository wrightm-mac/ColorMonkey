//
//  RgbColorSliderView.swift
//  ColorMonkey
//
//  Created by Michael Wright on 06/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class RgbColorSliderView: UIView {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    // MARK:    Fields...
    
    weak var parent: RgbColorSlider? = nil
    
    
    // MARK:    Overrides...
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        applyBorder(cornerSize: .medium, width: .medium, color: .black)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margin: CGFloat = 10.0
        let sliderHeight = frame.height / 3.0
        
        redSlider.frame = CGRect(x: margin, y: 0.0, width: frame.width - margin * 2.0, height: sliderHeight)
        greenSlider.frame = CGRect(x: margin, y: sliderHeight, width: frame.width - margin * 2.0, height: sliderHeight)
        blueSlider.frame = CGRect(x: margin, y: sliderHeight * 2.0, width: frame.width - margin * 2.0, height: sliderHeight)
    }
    
    
    // MARK:    Methods...
    func notifySliderValueChanged() {
        if let parent = parent {
            parent.sliderValueChanged(red: UInt8(redSlider.value.rounded()), green: UInt8(greenSlider.value.rounded()), blue: UInt8(blueSlider.value.rounded()))
        }
    }
    
    
    // MARK:    Events...
    
    @IBAction func redSliderValueChanged(_ sender: UISlider) {
        notifySliderValueChanged()
    }
    
    @IBAction func greenSliderValueChanged(_ sender: UISlider) {
        notifySliderValueChanged()
    }
    
    @IBAction func blueSliderValueChanged(_ sender: UISlider) {
        notifySliderValueChanged()
    }
}
