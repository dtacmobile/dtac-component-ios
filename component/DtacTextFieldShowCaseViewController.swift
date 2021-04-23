//
//  DtacTextFieldShowCaseViewController.swift
//  component
//
//  Created by CHAKRIT PANIAM on 22/4/2564 BE.
//

import UIKit

class DtacTextFieldShowCaseViewController: UIViewController {

    
    @IBOutlet var textField: dtacTextField!
    @IBOutlet var textFieldWithTitle: dtacTextField!
    @IBOutlet var textFieldWithDescription: dtacTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textFieldWithTitle.titleText = "หัวข้อ"
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.textFieldWithDescription.descriptionText = "Error!"
            self.textFieldWithDescription.negative()
        }
        
        
    }
}

