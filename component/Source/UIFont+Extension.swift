//
//  UIFont+Extension.swift
//  component
//
//  Generated on Zeplin. (9/10/2020).
//  Copyright (c) 2020 dtac. All rights reserved.
//

import UIKit

fileprivate let DTAC2013Bold : String = "DTAC2013-Bold"
fileprivate let DTAC2013Regular : String = "DTAC2013-Regular"
fileprivate let DTAC2013Light : String = "DTAC2013-Light"

fileprivate let DTAC2018Bold : String = "DTAC2018-Bold"
fileprivate let DTAC2018Regular : String = "DTAC2018-Regular"
fileprivate let DTAC2018Light : String = "DTAC2018-Light"

extension CGFloat {
    func scaled() -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return self/375.0 * UIScreen.main.bounds.width
        }
        
        return self
    }
}

struct DtacFontSize {
    
    static var h1 : CGFloat = 22.0
    static var h2 : CGFloat = 20.0

    static var title : CGFloat = 18.0

    static var body : CGFloat = 16.0
    static var body2 : CGFloat = 14.0
    static var small : CGFloat = 12.0
    
}

extension UIFont {
    
    @objc
    var h1: UIFont {
        return self.withSize(DtacFontSize.h1)
    }
    
    @objc
    var h2: UIFont {
        return self.withSize(DtacFontSize.h2)
    }
    
    @objc
    var title: UIFont {
        return self.withSize(DtacFontSize.title)
    }
    
    @objc
    var body: UIFont {
        return self.withSize(DtacFontSize.body)
    }
    
    @objc
    var body2: UIFont {
        return self.withSize(DtacFontSize.body2)
    }
    
    @objc
    var small: UIFont {
        return self.withSize(DtacFontSize.small)
    }
    
    class var dtacBold: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.body2)!
    }
    
    @objc
    class var dtacRegular: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.body2)!
    }
    
    class var dtacLight: UIFont {
        return UIFont(name: DTAC2018Light, size: DtacFontSize.body2)!
    }

    class var specialText: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.h1)!
    }
    
    class var headline1: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.h1)!
    }
    
    @objc
    class var headline2: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.h2)!
    }
        
    class var title1: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.title)!
    }
    
    class var title2: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.body)!
    }
    
    class var title3: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.body2)!
    }

    class var textlink: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.body2)!
    }

    class var body1: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.body)!
    }

    class var body2: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.body2)!
    }

    class var body3: UIFont {
        return UIFont(name: DTAC2018Regular, size: DtacFontSize.body2)!
    }

    class var tabbarActive: UIFont {
        return UIFont(name: DTAC2018Bold, size: DtacFontSize.small)!
    }

    class var tabbarInactive: UIFont {
        return UIFont(name: DTAC2018Regular, size:  DtacFontSize.small)!
    }

    @objc
    func scaled() -> UIFont {
        return UIFont(name: self.fontName, size: self.pointSize.scaled())!
    }

}
