//
//  UIFont+Extension.swift
//  component
//
//  Generated on Zeplin. (9/10/2020).
//  Copyright (c) 2020 dtac. All rights reserved.
//

import UIKit

fileprivate let DTAC2018Bold : String = "DTAC2018-Bold"
fileprivate let DTAC2018Regular : String = "DTAC2018-Regular"
fileprivate let DTAC2018Light : String = "DTAC2018-Light"

extension CGFloat {
    func scaled() -> CGFloat {
        var fontSize = self
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            switch UIDevice.screenInchType {
            case .iPhone4in: fontSize = self - 2 //iphone 5
            case .iPhone4dot7in: fontSize = self //iphone 6
            case .iPhone5dot5in: fontSize = self// + 4 //iphone 6+
            case .iPhone5dot8in: fontSize = self// + 4 //iphone 11 pro
            case .iPhone6dot1in: fontSize = self// + 4 //iphone 11
            case .iPhone6dot5in: fontSize = self// + 4 //iphone 11 pro max
            default: fontSize = self - 2 //iphone 4
            }
            
        } else { //ipad
            fontSize = self + 4
        }
        
        return fontSize
    }
}

struct DtacFontSize {
    
    static var h1: CGFloat = 40.0
    static var h2: CGFloat = 24.0
    static var h3: CGFloat = 18.0
    static var body: CGFloat = 16.0
    static var bodySmall: CGFloat = 14.0
    static var micro: CGFloat = 12.0
    
}

extension UIFont {
    //MARK: - Regular
    class var h1: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.h1.scaled())!
    }
    
    class var h2: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.h2.scaled())!
    }
    
    class var h3: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.h3.scaled())!
    }
    
    class var body: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.body.scaled())!
    }
    
    class var bodySmall: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.bodySmall.scaled())!
    }
    
    class var micro: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.micro.scaled())!
    }
    
    //MARK: - Bold
    class var h1Bold: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.h1.scaled())!
    }
    
    class var h2Bold: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.h2.scaled())!
    }
    
    class var h3Bold: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.h3.scaled())!
    }
    
    class var bodyBold: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.body.scaled())!
    }
    
    class var bodySmallBold: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.bodySmall.scaled())!
    }
    
    class var microBold: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.micro.scaled())!
    }
    
    //MARK: - Light
    class var h1Light: UIFont {
        return UIFont(name: DTAC2018Light, size: DtacFontSize.h1.scaled())!
    }
    
    class var h2Light: UIFont {
        return UIFont(name: DTAC2018Light, size: DtacFontSize.h2.scaled())!
    }
    
    class var h3Light: UIFont {
        return UIFont(name: DTAC2018Light, size: DtacFontSize.h3.scaled())!
    }
    
    class var bodyLight: UIFont {
        return UIFont(name: DTAC2018Light, size: DtacFontSize.body.scaled())!
    }
    
    class var bodySmallLight: UIFont {
        return UIFont(name: DTAC2018Light, size: DtacFontSize.bodySmall.scaled())!
    }
    
    class var microLight: UIFont {
        return UIFont(name: DTAC2018Light, size: DtacFontSize.micro.scaled())!
    }
    
    //MARK: - Scale
    private func scaled() -> UIFont {
        return UIFont(name: self.fontName, size: self.pointSize.scaled())!
    }
    
}
