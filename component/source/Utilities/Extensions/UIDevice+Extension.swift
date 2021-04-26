//
//  UIDevice+Extension.swift
//  component
//
//  Created by mac_riverpark on 26/4/2564 BE.
//

import UIKit
import AudioToolbox

extension UIDevice {
    static var deviceType: UIUserInterfaceIdiom {
        return UIDevice.current.userInterfaceIdiom
    }
    
    static var iPhone: Bool {
        return deviceType == .phone
    }
    
    static var iPad: Bool {
        return deviceType == .pad
    }
    
    enum ScreenInchType: Int {
        case iPhone4in
        case iPhone4dot7in
        case iPhone5dot5in
        case iPhone5dot8in
        case iPhone6dot1in
        case iPhone6dot5in
        case iPad9dot7in
        case iPad10dot5in
        case iPad11in
        case iPad12dot9in
        case unknown
    }
    
    static var screenInchType: ScreenInchType {
        switch UIScreen.main.nativeBounds.height {
        case 1136:
            return .iPhone4in
        case 1334:
            return .iPhone4dot7in
        case 1920, 2208:
            return .iPhone5dot5in
        case 2436:
            return .iPhone5dot8in
        case 1792:
            return .iPhone6dot1in
        case 2688:
            return .iPhone6dot5in
        case 2048:
            return .iPad9dot7in
        case 2224:
            return .iPad10dot5in
        case 2388:
            return .iPad11in
        case 2732:
            return .iPad12dot9in
        default:
            return .unknown
        }
    }
    
    enum SizeAssociatedDevice {
        case iPhone4in(CGFloat)
        case iPhone4dot7in(CGFloat)
        case iPhone5dot5in(CGFloat)
        case iPhone5dot8in(CGFloat)
        case iPhone6dot1in(CGFloat)
        case iPhone6dot5in(CGFloat)
        case iPad9dot7(CGFloat)
        case iPad10dot5(CGFloat)
        case iPad11in(CGFloat)
        case iPad12dot9(CGFloat)
    }
    
    static func sizeForAssociated(_ sizeDevices: [SizeAssociatedDevice], defaultSize: CGFloat = 16) -> CGFloat {
        for sizeAssociated in sizeDevices {
            switch sizeAssociated {
            case .iPhone4in(let size) where UIDevice.screenInchType == .iPhone4in:
                return size
            case .iPhone4dot7in(let size) where UIDevice.screenInchType == .iPhone4dot7in:
                return size
            case .iPhone5dot5in(let size) where UIDevice.screenInchType == .iPhone5dot5in:
                return size
            case .iPhone5dot8in(let size) where UIDevice.screenInchType == .iPhone5dot8in:
                return size
            case .iPhone6dot1in(let size) where UIDevice.screenInchType == .iPhone6dot1in:
                return size
            case .iPhone6dot5in(let size) where UIDevice.screenInchType == .iPhone6dot5in:
                return size
            case .iPad9dot7(let size) where UIDevice.screenInchType == .iPad9dot7in:
                return size
            case .iPad10dot5(let size) where UIDevice.screenInchType == .iPad10dot5in:
                return size
            case .iPad11in(let size) where UIDevice.screenInchType == .iPad11in:
                return size
            case .iPad12dot9(let size) where UIDevice.screenInchType == .iPad12dot9in:
                return size
            default: continue
            }
        }
        return defaultSize
    }
    
    static var deviceID: String {
        if let uuid = UIDevice.current.identifierForVendor?.uuidString {
            return uuid
        }
        return ""
    }
    
    var modelName: String {
        #if targetEnvironment(simulator)
        let identifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]!
        #else
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8 , value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        #endif
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPhone11,2":                              return "iPhone XS"
        case "iPhone11,4", "iPhone11,6":                return "iPhone XS Max"
        case "iPhone11,8":                              return "iPhone XR"
        case "iPhone12,1":                              return "iPhone 11"
        case "iPhone12,3":                              return "iPhone 11 Pro"
        case "iPhone12,5":                              return "iPhone 11 Pro Max"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad7,5", "iPad7,6":                      return "iPad 6"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro (12.9-inch) (2nd generation)"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro (10.5-inch)"
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":return "iPad Pro (11-inch)"
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":return "iPad Pro (12.9-inch) (3rd generation)"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        default:                                        return identifier
        }
    }
    
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}
