//
//  DtacTextFieldShowCaseViewController.swift
//  component
//
//  Created by CHAKRIT PANIAM on 22/4/2564 BE.
//

import UIKit

class DtacTextFieldShowCaseViewController: UIViewController {

    
    @IBOutlet var textField: dtacTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textField.positive()
    }

}

