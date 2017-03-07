//
//  HslColorSliderView.swift
//  ColorMonkey
//
//  Created by Michael Wright on 07/03/2017.
//  Copyright © 2017 wrightm@mac.com. All rights reserved.
//

import UIKit


class HslColorSliderView: UIView {
    
    @IBOutlet weak var hueSlider: UISlider!
    @IBOutlet weak var saturationSlider: UISlider!
    @IBOutlet weak var brightnessSlider: UISlider!
    
    
    
    // MARK:    Fields...
    
    weak var parent: HslColorSlider? = nil
    
    
    // MARK:    Overrides...
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        applyBorder(cornerSize: .medium, width: .medium, color: .black)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margin: CGFloat = 10.0
        let sliderHeight = frame.height / 3.0
        
        hueSlider.frame = CGRect(x: margin, y: 0.0, width: frame.width - margin * 2.0, height: sliderHeight)
        saturationSlider.frame = CGRect(x: margin, y: sliderHeight, width: frame.width - margin * 2.0, height: sliderHeight)
        brightnessSlider.frame = CGRect(x: margin, y: sliderHeight * 2.0, width: frame.width - margin * 2.0, height: sliderHeight)
    }
    
    
    // MARK:    Methods...
    func notifySliderValueChanged() {
        if let parent = parent {
            parent.sliderValueChanged(hue: Int(hueSlider.value.rounded()), saturation: Int(saturationSlider.value.rounded()), brightness: Int(brightnessSlider.value.rounded()))
        }
    }
    
    
    // MARK:    Events...
    
    @IBAction func hueSliderValueChanged(_ sender: UISlider) {
        notifySliderValueChanged()
    }
    
    @IBAction func saturationSliderValueChanged(_ sender: UISlider) {
        notifySliderValueChanged()
    }
    
    @IBAction func brightnessSliderValueChanged(_ sender: UISlider) {
        notifySliderValueChanged()
    }
}
