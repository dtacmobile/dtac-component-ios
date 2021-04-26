//
//  dtacTypographyH1Black.swift
//  component
//
//  Created by mac_riverpark on 23/4/2564 BE.
//

import UIKit

public class dtacTypographyH2Black: dtacTypographyH2 {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    override func commonInit(){
        self.textColor = DtacColor.primaryTelenorBlack
    }
}
