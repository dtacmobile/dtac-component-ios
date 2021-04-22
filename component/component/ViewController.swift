//
//  ViewController.swift
//  component
//
//  Created by CHAKRIT PANIAM on 22/4/2564 BE.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet var textfield1 : dtacTextField!
    @IBOutlet var textfield2 : dtacTextField!
    @IBOutlet var textfield3 : dtacTextField!
    @IBOutlet var textfield4 : dtacTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        textfield2.positive()
        textfield3.waring()
        textfield4.negative()
    }


}

