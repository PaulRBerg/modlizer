//
//  APLoginNetwork.swift
//  Modlizer
//
//  Created by Paul Berg on 17/07/2017.
//  Copyright © 2017 Paul Berg. All rights reserved.
//

import UIKit

/**
 *  A class which simplifies the process of retrieving some colors throughout the app.
 */
class APColor {
    /**
     *  The most common background color used.
     */
    class var background: UIColor {
        get {
            return UIColor(red: 238/255.0, green: 240/255.0, blue: 246/255.0, alpha: 1.0)
        }
    }
    
    /**
     *  The most common dark blue color used throughout the app.
     */
    class var darkBlue: UIColor {
        get {
            return UIColor(red: 0/255.0, green: 38/255.0, blue: 99/255.0, alpha: 1.0)
        }
    }
    
    /**
     *  The most common gray collor used throughout the app.
     */
    class var gray: UIColor {
        get {
            return UIColor(red: 1/255.0, green: 26/255.0, blue: 81/255.0, alpha: 1.0)
        }
    }
    
    /**
     *  The most common green color used throughout the app.
     */
    class var green: UIColor {
        get {
            return UIColor(red: 107/255.0, green: 209/255.0, blue: 107/255.0, alpha: 1.0)
        }
    }
    
    /**
     *  A nice highlight color used to show errors (mostly, but not only).
     */
    class var highlight: UIColor {
        get {
            return UIColor(red: 180/255.0, green: 70/255.0, blue: 65/255.0, alpha: 1.0)
        }
    }
    
    /**
     *  The most common light green color used throughout the app.
     */
    class var lightGreen: UIColor {
        get {
            return UIColor(red: 158/255.0, green: 245/255.0, blue: 167/255.0, alpha: 1.0)
        }
    }
    
    /**
     *  The main color.
     */
    class var main: UIColor {
        get {
            return UIColor(red: 239/255.0, green: 133/255.0, blue: 51/255.0, alpha: 1.0)
        }
    }
    
    /**
     *  The color to be used on pacing.
     */
    class var pacingGreen: UIColor {
        get {
            return UIColor(red: 92/255.0, green: 180/255.0, blue: 65/255.0, alpha: 1.0)
        }
    }
    
    /**
     *  The color to be used on the underpacing/ overpacing.
     */
    class var pacingRed: UIColor {
        get {
            return UIColor(red: 234/255.0, green: 77/255.0, blue: 78/255.0, alpha: 1.0)
        }
    }
}

/**
 *  Helper funcs.
 */
extension APColor {
    
    /**
     *  Converts a hex to a UIColor.
     */
    class func parse(hex: String) -> UIColor {
        let result = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: result).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch result.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            return .clear
        }
        return UIColor(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
