//
//  dtacPrimaryButtonBlue.swift
//  component
//
//  Created by mac_riverpark on 30/4/2564 BE.
//

import UIKit

@IBDesignable class dtacPrimaryButtonBlue: UIButton {
    
    // The text that's shown in each state
    @IBInspectable var selectedText:String = "Selected"
    @IBInspectable var deselectedText:String = "Deselected"
    
    // Sets the Active/Inactive State
    @IBInspectable var active:Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.layer.applySketchShadow(color: UIColor(red: 0.38, green: 0.38, blue: 0.44, alpha: 1.00), alpha: 0.16, x: 0, y: 2, blur: 4, spread: 0)
        
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = false
        self.addTarget(self, action: #selector(onPress), for: .touchUpInside)
        
        active ? setSelected() : setDeselected()
    }
    
    
    @objc func onPress() {
        active = !active
        active ? setSelected() : setDeselected()
    }
    
    // Set the selected properties
    func setSelected() {
        self.backgroundColor = DtacColor.primaryTelenorLink
        self.titleLabel?.font = UIFont.bodyBold
        self.setTitleColor(DtacColor.graysWhite, for: .normal)
    }
    
    // Set the deselcted properties
    func setDeselected() {
        self.backgroundColor = DtacColor.graysLightGray2
        self.titleLabel?.font = UIFont.bodyBold
        self.setTitleColor(DtacColor.graysDarkGray, for: .normal)
    }
}
