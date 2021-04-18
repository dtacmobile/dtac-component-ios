//
//  FirstViewController.swift
//  component
//
//  Created by Siam Wannakosit on 22/1/20.
//  Copyright © 2020 dtac. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class FirstViewController: UIViewController {

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

