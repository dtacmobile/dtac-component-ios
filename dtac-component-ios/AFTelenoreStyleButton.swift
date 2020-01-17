//
//  AFTelenoreStyleButton.swift
//  affiliate
//
//  Created by sopana on 9/11/2562 BE.
//  Copyright © 2562 dtac. All rights reserved.
//

import UIKit

class AFTelenoreStyleButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @objc
    enum ButtonStyle: Int {
        case secondary = 0
        case primary = 1
        case disable = 2
        case secondaryGreyStyle = 3
    }
    
    @objc
    @IBInspectable var buttonStyle:ButtonStyle = .primary {
        didSet {
            updateStyle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.roundCorner(radius: 4.0)
        self.layer.cornerRadius = 4.0
//        self.titleLabel?.font = UIFont.dtacRegular.body2
        self.titleLabel?.font = UIFont.telenorSubheading2()
        updateStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        self.roundCorner(radius: 4.0)
        self.layer.cornerRadius = 4.0
//        self.titleLabel?.font = UIFont.dtacRegular.body2
        self.titleLabel?.font = UIFont.telenorSubheading2()
        updateStyle()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateStyle()
    }
    
    private func updateStyle() {
        
        switch buttonStyle {
        case .primary:
            self.layer.borderWidth = 0.0
//            self.backgroundColor = UIColor.afTelenorlink
            self.backgroundColor = UIColor.telenorLink
            self.setTitleColor(UIColor.white, for: .normal)
        case .disable:
            self.layer.borderWidth = 0.0
//            self.backgroundColor = UIColor.afInactiveButtonGrey
            self.backgroundColor = UIColor.telenorLightGray2
            self.setTitleColor(UIColor.white, for: .normal)
        case .secondaryGreyStyle:
            self.layer.borderWidth = 1.0
//            self.layer.borderColor = UIColor.brownishGrey.cgColor
            self.layer.borderColor = UIColor.telenorLightGray2.cgColor
            self.backgroundColor = UIColor.white
//            self.setTitleColor(UIColor.afTextBlack, for: .normal)
            self.setTitleColor(UIColor.telenorText, for: .normal)
        default:
            self.layer.borderWidth = 1.0
//            self.layer.borderColor = UIColor.afTelenorlink.cgColor
            self.layer.borderColor = UIColor.telenorLightGray2.cgColor
            self.backgroundColor = UIColor.white
//            self.setTitleColor(UIColor.afTelenorlink, for: .normal)
            self.setTitleColor(UIColor.telenorText, for: .normal)
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
