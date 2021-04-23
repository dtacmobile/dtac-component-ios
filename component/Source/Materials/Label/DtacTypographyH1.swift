//
//  DtacTypographyH1.swift
//  component
//
//  Created by mac_riverpark on 23/4/2564 BE.
//

import UIKit

public class DtacTypographyH1: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit(){
        self.textColor = UIColor.red
        self.backgroundColor = UIColor.clear
        self.textAlignment = .left
        self.numberOfLines = 1
        self.font = UIFont.dtacRegular.h1
       
    }
}
