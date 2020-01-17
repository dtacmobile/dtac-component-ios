//
//  ViewController.swift
//  dtac-component-ios
//
//  Created by Akebordin Duangphoommes on 16/1/20.
//  Copyright © 2020 Akebordin Duangphoommes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Test button component programmatically.
//        let button = DTACButton(style: .outline);
//        button.setTitle("สวัสดีครับ", for: .normal)
//        button.center = view.center
//        view.addSubview(button)
//        button.isEnabled = false
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

                let alertController = dtacAlertController(icon: UIImage(named: "bad_alert_image"), title: "Title", heading: "Heading", message: "Message")
                let okAction = dtacAlertAction(title: "ok", style: .positive) { (dtacAlertAction) in
        //            [self closeModal:nil];
                }
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
    }


}

