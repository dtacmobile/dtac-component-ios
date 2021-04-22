//
//  AFTelenoreStyleButton.swift
//  affiliate
//
//  Created by sopana on 9/11/2562 BE.
//  Copyright © 2562 dtac. All rights reserved.
//

import UIKit

class DtacStyleButton: UIButton {

    @objc
    enum ButtonStyle: Int {
        case primaryButton = 0
        case outlineButton = 1
        case linkButton = 2
        case listButton = 3
        case disable = 4
    }
    
    private let cornerRadius: CGFloat = 3.0
    
    @objc
    @IBInspectable var buttonStyle:ButtonStyle = .primaryButton {
        didSet {
            updateStyle()
        }
    }
    
    @IBInspectable
    var style: String? {
        willSet {
            let lowercased = newValue?.lowercased()
            if (lowercased == "primary") {
                buttonStyle = .primaryButton
            }
            else if (lowercased == "outline") {
                buttonStyle = .outlineButton
            }
            else if (lowercased == "link") {
                buttonStyle = .linkButton
            }
            else if (lowercased == "list") {
                buttonStyle = .listButton
            }
            else if (lowercased == "disable") {
                buttonStyle = .disable
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.roundCorner(radius: cornerRadius)
        self.titleLabel?.font = UIFont.dtacRegular.body2
        updateStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.roundCorner(radius: cornerRadius)
        self.titleLabel?.font = UIFont.dtacRegular.body2
        updateStyle()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateStyle()
    }
    
    private func updateStyle() {
        
        switch buttonStyle {
        case .primaryButton:
            self.layer.borderWidth = 0.0
            self.backgroundColor = UIColor.telenorLink
            self.setTitleColor(UIColor.white, for: .normal)
            
        case .outlineButton:
            self.layer.borderWidth = 1.0
            self.backgroundColor = UIColor.clear
            self.layer.borderColor = UIColor.telenorText.cgColor
            self.setTitleColor(UIColor.telenorText, for: .normal)
            
        case .linkButton:
            self.layer.borderWidth = 0.0;
            self.backgroundColor = UIColor.clear
            if (image(for: .normal) == nil) {
                setImage(UIImage(named: "dtacDisclosure")?.withRenderingMode(.alwaysTemplate), for: .normal)
            }
            self.setTitleColor(UIColor.telenorLink, for: .normal)
            self.imageView?.tintColor = UIColor.telenorLink
            self.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft
            
        case .listButton:
            self.layer.borderWidth = 0.0
            self.backgroundColor = UIColor.clear
            self.setTitleColor(UIColor.telenorLink, for: .normal)
        case .disable:
            self.layer.borderWidth = 0.0
            self.backgroundColor = UIColor.inactiveButtonGrey
            self.setTitleColor(UIColor.white, for: .normal)
            
        default:
            self.layer.borderWidth = 1.0
            self.layer.borderColor = UIColor.telenorLink.cgColor
            self.backgroundColor = UIColor.white
            self.setTitleColor(UIColor.telenorLink, for: .normal)
        }
        
        if let title = self.title(for: .normal), let titleColor = self.titleColor(for: .normal) {
            self.setAttributedTitle(NSAttributedString(string: title, attributes: [
                NSAttributedString.Key.foregroundColor : titleColor
            ]), for: .normal)
        }
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        updateStyle()
    }
    
}

public extension UIColor {

    @objc
    class var telenorLink: UIColor {
        get { return UIColor(red: 0.0, green: 122.0 / 255.0, blue: 208.0 / 255.0, alpha: 1.0) }
    }
    
    @objc
    class var telenorDarkGray: UIColor {
        return UIColor(white: 118.0 / 255.0, alpha: 1.0)
    }
    
    @objc
    class var telenorText: UIColor {
        return UIColor(white: 26.0 / 255.0, alpha: 1.0)
    }
    
    @objc
    class var inactiveButtonGrey: UIColor {
      return UIColor(red: 200.0 / 255.0, green: 207.0 / 255.0, blue: 210.0 / 255.0, alpha: 1.0)
    }
}

