//
//  DTACGridItem.swift
//  dtac-component-ios
//
//  Created by Akebordin Duangphoommes on 28/1/20.
//  Copyright © 2020 Akebordin Duangphoommes. All rights reserved.
//

import UIKit

public class DTACGridItem: UIView {
    
    private let padding: CGFloat = 8.0
    private let titleLabelHeight: CGFloat = 30.0
    
    open var image: UIImage?
    open var titleLabel: UILabel?
    open var imageView: UIImageView?
    
    weak open var delegate: DTACGridItemDelegate? {
        didSet { if gestureRecognizers == nil { addGestureRecognizer(UITapGestureRecognizer(target: self.delegate, action: #selector(delegate?.gridItemDidTap(_:)))) } }
    }
    
    @available(iOS 9.0, *)
    public init(image: UIImage?, title: String) {
//        super.init(frame: .zero)
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 90.0, height: 90.0))
        
        imageView = UIImageView(image: image)
        imageView?.bounds = CGRect(x: 0.0, y: 0.0, width: 32.0, height: 32.0)
        addSubview(imageView!)
        
        titleLabel = UILabel()
        titleLabel?.font = .telenorCaption2()
        titleLabel?.textColor = .telenorText
        titleLabel?.numberOfLines = 2
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineHeightMultiple = 0.8
        titleLabel?.attributedText = NSAttributedString(string: title, attributes: [NSAttributedString.Key.paragraphStyle : paragraphStyle])
        addSubview(titleLabel!)
        
        imageView?.center = CGPoint(x: center.x, y: center.y - padding - padding)
        titleLabel?.frame = CGRect(x: padding, y: (imageView?.frame.origin.y)! + (imageView?.frame.size.height)! + padding, width: frame.size.width - padding - padding, height: titleLabelHeight)
        
        
        
    }
    
    @available(*, unavailable)
    init() {
        fatalError()
    }
    
    @available(*, unavailable)
    override init(frame: CGRect) {
        fatalError()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

@objc
public protocol DTACGridItemDelegate : NSObjectProtocol {
    
    @objc
    optional func gridItemDidTap(_ gridItem: DTACGridItem)
}
