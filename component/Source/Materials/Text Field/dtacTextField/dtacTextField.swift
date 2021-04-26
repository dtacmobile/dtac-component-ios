//
//  dtacTextField.swift
//  component
//
//  Created by CHAKRIT PANIAM on 18/4/2564 BE.
//  Copyright © 2564 BE dtac. All rights reserved.
//

import UIKit

@IBDesignable class dtacTextField: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descritionLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    
    
    override func prepareForInterfaceBuilder(){
        titleLabel.text = "title"
        descritionLabel.text = "description"
        textField.text = ""
    }
    
    
    @IBInspectable public var text: String = "" {
        didSet{
            self.textField.text = text
        }
    }
    
    @IBInspectable public var titleText: String = "" {
        didSet{
            self.titleLabel.isHidden = false
            self.titleLabel.text = titleText
        }
    }
    
    @IBInspectable public var descriptionText: String = "" {
        didSet{
            self.descritionLabel.isHidden = false
            self.descritionLabel.text = descriptionText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }


    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    

    private func setup() {
        
        let bundle = Bundle(for: dtacTextField.self)
        bundle.loadNibNamed(String(describing: dtacTextField.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        
    
//        self.textField.layer.borderColor = UIColor.shadow.cgColor
        self.textField.layer.borderWidth = 1
        self.textField.layer.cornerRadius = 3
        self.textField.clipsToBounds = true
        self.textField.placeholder = "hint"
        self.textField.font = UIFont.body
        
        self.titleLabel.isHidden = true
        self.descritionLabel.isHidden = true
        
    }
    
    open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: padding)
    }
    
    open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    

    func positive() {
//        self.textField.layer.borderColor = UIColor.success.cgColor
//        self.descritionLabel.textColor = UIColor.success
    }

    func negative() {
//        self.textField.layer.borderColor = UIColor.nagative.cgColor
//        self.descritionLabel.textColor = UIColor.nagative
    }

    func waring() {
//        self.textField.layer.borderColor = UIColor.waring.cgColor
    }
    
}
