//
//  UIColor+Extension.swift
//  component
//
//  Generated on Zeplin. (23/01/2020).
//  Copyright (c) 2020 dtac. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(hex8: UInt32) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex8 & 0xFF000000) >> 24) / divisor
        let green   = CGFloat((hex8 & 0x00FF0000) >> 16) / divisor
        let blue    = CGFloat((hex8 & 0x0000FF00) >>  8) / divisor
        let alpha   = CGFloat( hex8 & 0x000000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    convenience init(rgba: String) {
        
        var startIndex:Int = 0
        
        if rgba.hasPrefix("#") {
            startIndex = 1
        }
        
        let hexString: String = String(rgba[String.Index(utf16Offset: startIndex, in: rgba)...])
        var hexValue:  UInt32 = 0
        
        guard Scanner(string: hexString).scanHexInt32(&hexValue) else {
            self.init(hex6: 0)
            return
        }
        
        switch (hexString.count) {
        case 6:
            self.init(hex6: hexValue)
        case 8:
            self.init(hex8: hexValue)
        default:
            self.init(hex6: 0)
        }
        
    }
}
