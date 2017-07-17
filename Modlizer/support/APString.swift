//
//  APLoginNetwork.swift
//  Modlizer
//
//  Created by Paul Berg on 17/07/2017.
//  Copyright © 2017 Paul Berg. All rights reserved.
//
import UIKit

/**
 *  Some of the most common strings used throughout the app. This also helps internatiozaling the app.
 */
class APString {
    
    class var ok: String {
        get {
            return NSLocalizedString("Ok", comment: "")
        }
    }
    
    class var yes: String {
        get {
            return NSLocalizedString("Yes", comment: "")
        }
    }
    
    class var cancel: String {
        get {
            return NSLocalizedString("Cancel", comment: "")
        }
    }
    
    class var oops: String {
        get {
            return NSLocalizedString("Oops", comment: "")
        }
    }
    
    class var emailError: String {
        get {
            return NSLocalizedString("Please connect an email account to Apple’s native Mail app.", comment: "")
        }
    }
    
    class var facebookError: String {
        get {
            return NSLocalizedString("Unfortunately, some Facebook API issue occurred. Please try again.", comment: "")
        }
    }
    
    class var networkError: String {
        get {
            return NSLocalizedString("Unfortunately, some networking issue occurred. Please try again.", comment: "")
        }
    }
}

/**
 *  Helper extension for the general purposes strings.
 */
extension String {
    subscript (index: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: index)
        return self[charIndex]
    }
}

/**
 *  Helper extension for the Modlizer formatting system.
 */
extension String {
    
    /**
     *  Tells if the string is valid (no 0 length, no only white spaces).
     */
    func isValid() -> Bool {
        if characters.count == 0 {
            return false
        }
        
        if self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines) == "" {
            return false
        }

        return true
    }
   
    /**
     *  Cleans all the undesired characters, such as national specific ones.
     */
    func removeSpecialCharacters() -> String {
        let cleanString = folding(options: .diacriticInsensitive, locale: .current)
        let okayCharacters : Set<Character> =
            Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_".characters)
        return String(cleanString.characters.filter {okayCharacters.contains($0) })
    }
}

extension String {
    /**
     *  Tells if one string is formatted as a desired Modlier email address.
     */
    mutating func isEmail() -> Bool {
        if !isValid() {
            return false
        }
        
        /**
         *  An email must have a "@" and a dot. Also, it is not allowed to have any spaces or double dots: "..".
         */
        if range(of: "@") == nil || range(of: ".") == nil || range(of: "..") != nil {
            return false
        }
        
        let parts = components(separatedBy: "@")
        
        /**
         *  Verify the local name firstly.
         */
        let local = parts[0]
        if local.characters.count > 64 {
            return false
        }

        /**
            Then, take a look at the domain.
         */
        let domain = parts[1]
        if domain.characters.count > 255 {
            return false
        }
        if domain.range(of: ".") == nil {
            return false
        }
        
        self = lowercased()
        return true
    }
    
    /**
     *  Tells if one string is formatted as a desired Modlizer password.
     */
    func isPassword() -> Bool {
        // We do not allow less than 8 characters and more than 100.
        if characters.count < 8 || characters.count > 100 {
            return false
        }
        
        // We do not allow spaces at the beginning and at the end of the string.
        if self[0] == " " || self[characters.count-1] == " " {
            return false
        }
        return true
    }
}


extension String {
    /**
     *  Transforms the string into a formatted big number (eg: 10,000,000).
     */
    func formatNumber() -> String {
        
        /**
         *  Creating the number formatter.
         */
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0
        
        /**
            If the app does not have a grouping separator, we stop here. This is extremely odd.
         */
        guard let groupingSeparator = formatter.groupingSeparator else {
            return self
        }
        
        /**
         *  If everything is good, we return the result.
         */
        let textWithoutGroupingSeparator = replacingOccurrences(of: groupingSeparator, with: "")
            if let numberWithoutGroupingSeparator = formatter.number(from: textWithoutGroupingSeparator) {
                if let formattedText = formatter.string(from: numberWithoutGroupingSeparator) {
                    return formattedText
                }
        }
        
        return self
    }
    
    /**
     *  Converts a formatted big number (eg: 10,000,000) to a float value. Usually, we need this function to retrieve the number value of one text field's `text` property.
     */
    func simpleNumber() -> Float {
        var formattedString = self
        /**
         *  Basically, because of the number formatting, we want to obtain the float value of the number again by replacing the separator character and the spaces with "".
         */
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0
        /**
         *  If the app does not have a grouping separator, we stop here. This is extremely odd.
         */
        guard let groupingSeparator = formatter.groupingSeparator else {
            return 0
        }
        formattedString = formattedString.replacingOccurrences(of: groupingSeparator, with: "")
        formattedString = formattedString.replacingOccurrences(of: " ", with: "")
        
        /**
         *  If we can't convert the budget and the fee to floats, we obviously stop here.
         */
        guard let floatValue = Float(formattedString) else {
            return 0
        }
        return floatValue
    }
}


extension String {
    /**
     *  Simply generates some `very` random strings.
     */
    static func random() -> String {
        return self.random(length: 20)
    }
    
    static func random(length: Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
}
