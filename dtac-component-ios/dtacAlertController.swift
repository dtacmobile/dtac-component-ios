//
//  dtacAlertController.swift
//  dtac-iservice
//
//  Created by sopana on 20/12/2562 BE.
//  Copyright © 2562 TOTAL ACCESS COMMUNICATION PUBLIC COMPANY LIMITED. All rights reserved.
//

import UIKit

@objc
//class dtacAlertAction: AFTelenoreStyleButton {
class dtacAlertAction: DTACButton {
    
    typealias dtacAlertActionHandler = ((dtacAlertAction) -> Void)
    
    @objc
    enum ActionStyle : Int {
        case neutral = 0
        case positive
        case cancel
    }
    
    fileprivate var handler:dtacAlertActionHandler?
    
    @objc
    init(title: String, style: ActionStyle, handler:dtacAlertActionHandler?) {
        
//        super.init(frame:CGRect.zero)
        super.init(style: .primary)
        
        switch style {
            
        case .neutral:
//            self.buttonStyle = .secondary
            self.buttonStyle = .outline
            
        case .cancel:
//            self.buttonStyle = .secondaryGreyStyle
            self.buttonStyle = .outline
            
        case .positive:
            self.buttonStyle = .primary

        }
        
        self.setTitle(title, for: .normal)
        self.handler = handler
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

@objc
class dtacAlertController: UIViewController {
    
    var imageIcon: UIImage? {
        didSet {
            guard isViewLoaded else { return }
            
            iconImageView.image = imageIcon
            iconImageView.isHidden = (imageIcon == nil)
        }
    }
    
    var alertTitle: String? {
        didSet {
            guard isViewLoaded else { return }
            
            titleLabel.text = alertTitle
            titleLabel.isHidden = (alertTitle == nil)
        }
    }
    
    var alertHeading: String? {
        didSet {
            guard isViewLoaded else { return }
           
            headingLabel.text = alertHeading
            headingLabel.isHidden = (alertHeading == nil)
        }
    }
    
    var alertMessage: String? {
        didSet {
            guard isViewLoaded else { return }
            
            messageLabel.text = alertMessage
            messageLabel.isHidden = (alertMessage == nil)
        }
    }
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    
    private var actions:[dtacAlertAction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        titleLabel.font = UIFont.dtacBold.h2.scaled()
//        headingLabel.font = UIFont.dtacRegular.h2.scaled()
//        messageLabel.font = UIFont.dtacRegular.body.scaled()
        titleLabel.font = UIFont.telenorHeading1()
        headingLabel.font = UIFont.telenorSubheading2()
        messageLabel.font = UIFont.telenorBody()
        
//        titleLabel.textColor = UIColor.telenortext
//        headingLabel.textColor = UIColor.telenortext
//        messageLabel.textColor = UIColor.telenortext
        titleLabel.textColor = UIColor.telenorText
        headingLabel.textColor = UIColor.telenorText
        messageLabel.textColor = UIColor.telenorText
        
        iconImageView.image = imageIcon
        iconImageView.isHidden = (imageIcon == nil)

        titleLabel.text = alertTitle
        titleLabel.isHidden = (alertTitle == nil)

        headingLabel.text = alertHeading
        headingLabel.isHidden = (alertHeading == nil)

        messageLabel.text = alertMessage
        messageLabel.isHidden = (alertMessage == nil)
                
        if actions.count < 3 {
            buttonStackView.axis = .horizontal
        } else {
            buttonStackView.axis = .vertical
        }
        
        let screenWidth = UIScreen.main.bounds.width

        for action in actions {
            
            switch buttonStackView.axis {
                
            case .vertical:
                action.widthAnchor.constraint(equalToConstant: (screenWidth - 40)*0.7).isActive = true

            default:
                action.widthAnchor.constraint(equalToConstant: (screenWidth - 88)*0.5).isActive = true
                
            }
            
            buttonStackView.arragedView(action)
            
        }
    }
    
    @objc
    init(icon:UIImage?, title:String?, heading:String?, message:String?) {
        super.init(nibName: "dtacAlertController", bundle: Bundle.main)
        
        imageIcon = icon
        alertTitle = title
        alertHeading = heading
        alertMessage = message
                
        modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc
    func addAction(_ action: dtacAlertAction) {
                
        action.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        action.addTarget(self, action: #selector(dismissAlert(sender:)), for: .touchUpInside)
        actions.append(action)
        
    }
    
    @objc
    private func dismissAlert(sender: dtacAlertAction) {
        
        sender.handler?(sender)        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIStackView {
    
    func arragedView(_ subView:UIView) {
        subView.translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(subView)
    }
    
}
