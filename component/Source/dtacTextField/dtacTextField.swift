//
//  dtacTextField.swift
//  component
//
//  Created by CHAKRIT PANIAM on 18/4/2564 BE.
//  Copyright © 2564 BE dtac. All rights reserved.
//

import UIKit

open class dtacTextField: UITextField {
    
    lazy var innerShadow: CALayer = {
          let innerShadow = CALayer()
          layer.addSublayer(innerShadow)
          return innerShadow
      }()
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    func setup() {
        self.layer.borderColor = UIColor.shadow.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
        
        self.placeholder = "Start typing"
        self.font = UIFont.dtacRegular.body
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func positive() {
        self.layer.borderColor = UIColor.success.cgColor
    }
    
    func negative() {
        self.layer.borderColor = UIColor.nagative.cgColor
    }
    
    func waring() {
        self.layer.borderColor = UIColor.waring.cgColor
    }
    
}
