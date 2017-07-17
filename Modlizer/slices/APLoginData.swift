//
//  APLoginNetwork.swift
//  Modlizer
//
//  Created by Paul Berg on 17/07/2017.
//  Copyright © 2017 Paul Berg. All rights reserved.
//

import UIKit

class APLoginData {
    var dummy: String?
}

extension APLoginViewController {
    /**
     *  Checks to see if the entered profile data is valid.
     */
    func isDataValid() -> Bool {
        /**
         *  Email requirements.
         */
        if !emailTextField.text!.isEmail() {
            APAlert.top(NSLocalizedString("Invalid email address", comment: ""))
            return false
        }
        
        /**
         *  Password requirements.
         */
        // We do not allow less than 8 characters and more than 100.
        if passwordTextField.text!.characters.count < 8 || passwordTextField.text!.characters.count > 100 {
            APAlert.top(NSLocalizedString("Password must have between 8 and 100 letters", comment: ""))
            return false
        }
        
        // We do not allow spaces at the beginning and at the end of the string.
        if passwordTextField.text![0] == " " || passwordTextField.text![passwordTextField.text!.characters.count-1] == " " {
            APAlert.top(NSLocalizedString("Password's first and last char cannot be a space", comment: ""))
            return false
        }
        
        return true
    }
}
