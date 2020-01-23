//
//  CircleButton.swift
//  component
//
//  Created by Siam Wannakosit on 22/1/20.
//  Copyright © 2020 dtac. All rights reserved.
//

import UIKit

class CircleButton: UIButton {
    
    enum AmountMode {
        case amount(amount : String)
        case specify
    }
    
    var amount: AmountMode = .specify {
        didSet {
            switch amount {
            case .amount(let amount):
                setAmount(amount)
            default:
                specifyAmount()
            }
        }
    }
    
    open var borderColor: UIColor = UIColor.divider {
        didSet {
            circleLayer?.strokeColor = self.borderColor.cgColor
        }
    }
    
    open var circleColor: UIColor = UIColor.white {
        didSet {
            circleLayer?.fillColor = self.circleColor.cgColor
        }
    }

    private let amountTitleLable = UILabel()
    private let amountUnitLable = UILabel()
    private var circleLayer:CAShapeLayer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if self.circleLayer == nil {
            self.setupCircleLayer()
            self.bringSubviewToFront(amountTitleLable)
            self.bringSubviewToFront(amountUnitLable)
        }
        
        self.circleLayer?.frame = self.bounds
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    private func setupCircleLayer() {
        guard self.bounds.width > 0 && self.bounds.height > 0 else {
            return
        }
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0), radius: bounds.width / 2.0, startAngle: 0.0, endAngle: CGFloat(Double.pi * 2.0), clockwise: true)

        // Setup the CAShapeLayer with the path, colors, and line width
        let circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.lineWidth = 1.0;
        circleLayer.strokeEnd = 0.0
        circleLayer.fillColor = self.circleColor.cgColor
        circleLayer.strokeColor = self.borderColor.cgColor
        circleLayer.lineWidth = 1.0
        circleLayer.strokeEnd = 1.0
        self.layer.addSublayer(circleLayer)
        self.circleLayer = circleLayer
    }
    
    private func setupView() {
        self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1.0).isActive = true
        
        self.addView(amountTitleLable)
        
        amountTitleLable.numberOfLines = 1
        amountTitleLable.textAlignment = .center
        amountTitleLable.bottomAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        amountTitleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(12.0)).isActive = true
        amountTitleLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CGFloat(12.0)).isActive = true
        
        amountTitleLable.adjustsFontSizeToFitWidth = true
        amountTitleLable.minimumScaleFactor = 0.5
        amountUnitLable.textColor = UIColor.telenortext
        amountTitleLable.font = UIFont.dtacBold.body
        
        self.addView(amountUnitLable)
        
        amountUnitLable.numberOfLines = 1
        amountUnitLable.textAlignment = .center
        amountUnitLable.topAnchor.constraint(equalTo: amountTitleLable.bottomAnchor).isActive = true
        amountUnitLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(12.0)).isActive = true
        amountUnitLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -CGFloat(12.0)).isActive = true
        amountUnitLable.textColor = UIColor.brownishGrey
        amountUnitLable.font = UIFont.dtacBold.small

        
    }
    
    func specifyAmount() {
        amountTitleLable.text = "Specify"
        amountUnitLable.text = "..."
    }
    
    private func setAmount(_ amountBaht:String) {
        amountTitleLable.text = amountBaht
        amountUnitLable.text = "baht"
    }
    
    func setAmountWithUnit(_ amount:String,_ unit:String) {
        amountTitleLable.text = amount
        amountUnitLable.text = unit
    }
}
