//
//  DTACButton.swift
//  dtac-component-ios
//
//  Created by Akebordin Duangphoommes on 16/1/20.
//  Copyright © 2020 Akebordin Duangphoommes. All rights reserved.
//

import UIKit
import AudioToolbox

class DTACButton: UIButton {
    
    @objc
    enum DTACButtonStyle: Int {
        case primary
        case outline
        case link
        case list
    }
    
    private let cornerRadius: CGFloat = 3.0
    private let height: CGFloat = 48.0
    private let padding: CGFloat = 32.0
    
    private var requiresRenderLayout: Bool = true
    
    @IBInspectable
    var style: String? {
        willSet {
            let lowercased = newValue?.lowercased()
            if (lowercased == "primary") {
                buttonStyle = .primary
            } else if (lowercased == "outline") {
                buttonStyle = .outline
            } else if (lowercased == "link") {
                buttonStyle = .link
            } else if (lowercased == "list") {
                buttonStyle = .list
            }
        }
    }
    
    var buttonStyle: DTACButtonStyle = .outline {
        willSet { requiresRenderLayout = (newValue != buttonStyle) }
        didSet { layoutSubviews() }
    }
    
    override var isEnabled: Bool {
        willSet { requiresRenderLayout = (newValue != isEnabled) }
        didSet { layoutSubviews() }
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        requiresRenderLayout = (title != self.title(for: state))
        super.setTitle(title, for: state)
        layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (requiresRenderLayout) {
            if (super.titleLabel?.font != UIFont.telenorSubheading2()) {
                super.titleLabel?.font = UIFont.telenorSubheading2()
            }
            if (super.layer.cornerRadius != cornerRadius) {
                super.layer.cornerRadius = cornerRadius
            }
            
            let intrinsicContentSize = titleLabel?.intrinsicContentSize
            var frame = self.frame
            frame.size.width = padding + intrinsicContentSize!.width + padding
            frame.size.height = height
            titleEdgeInsets = .zero
            
            if (buttonStyle == .primary) {
                layer.borderWidth = .zero
                if (isEnabled) {
                    setTitleColor(.white, for: .normal)
                    backgroundColor = .telenorLink
                } else {
                    setTitleColor(.telenorDarkGray, for: .normal)
                    backgroundColor = .telenorLightGray2
                }
            } else if (buttonStyle == .outline) {
                layer.borderWidth = 1.0
                backgroundColor = .clear
                if (isEnabled) {
                    layer.borderColor = UIColor.telenorDarkGray.cgColor
                    setTitleColor(.telenorText, for: .normal)
                } else {
                    layer.borderColor = UIColor.telenorLightGray2.cgColor
                    setTitleColor(.telenorDarkGray, for: .normal)
                }
            } else if (buttonStyle == .link) {
                layer.borderWidth = .zero
                backgroundColor = .clear
                if (image(for: .normal) == nil) {
                    setImage(UIImage(named: "Disclosure")?.withRenderingMode(.alwaysTemplate), for: .normal)
                }
                if (isEnabled) {
                    setTitleColor(.telenorLink, for: .normal)
                    imageView!.tintColor = .telenorLink
                } else {
                    setTitleColor(.telenorLightGray2, for: .normal)
                    imageView!.tintColor = .telenorLightGray2
                }
                let spacing: CGFloat = 28.0
                titleEdgeInsets = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: spacing)
                imageEdgeInsets = UIEdgeInsets(top: .zero, left: intrinsicContentSize!.width + spacing + 2.0, bottom: 4.0, right: .zero)
            } else if (buttonStyle == .list) {
                layer.borderWidth = .zero
                backgroundColor = .clear
                if (isEnabled) {
                    setTitleColor(.telenorLink, for: .normal)
                } else {
                    setTitleColor(.telenorLightGray2, for: .normal)
                }
            }
            super.frame = frame
            requiresRenderLayout = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        if (isTouchInside) {
            AudioServicesPlaySystemSound(1519)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (isTouchInside) {
            AudioServicesPlaySystemSound(1520)
        }
        super.touchesEnded(touches, with: event)
    }
    
    @available(iOS 9.0, *)
    init(style: DTACButtonStyle) {
        super.init(frame: .zero)
        defer {
            buttonStyle = style
        }
    }
    
    @available(*, unavailable)
    init() {
        fatalError()
    }
    
    @available(*, unavailable)
    override init(frame: CGRect) {
        fatalError()
    }
    
    @available(*, unavailable)
    override class func systemButton(with image: UIImage, target: Any?, action: Selector?) -> Self {
        fatalError()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
