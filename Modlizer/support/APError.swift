//
//  APLoginNetwork.swift
//  Modlizer
//
//  Created by Paul Berg on 17/07/2017.
//  Copyright © 2017 Paul Berg. All rights reserved.
//

import UIKit
import FirebaseAuth
import MBProgressHUD

/**
 *  A helper class which handles some common error actions.
 */
class APError {
    
    /**
     *  Handles the Firebase credential errors. They are self-explanatory.
     */
    class func credential(_ error: Error) {
        var message = ""        
        switch (FIRAuthErrorCode(rawValue: (error._code))!) {
            /**
             *  Login & Sign Up.
             */
            case .errorCodeInvalidEmail:
                message = NSLocalizedString("This email format appears to be invalid", comment: "")
                break
            case .errorCodeEmailAlreadyInUse:
                message = NSLocalizedString("This email appears to be already in use", comment: "")
                break
            case .errorCodeWrongPassword:
                message = NSLocalizedString("Incorrect password", comment: "")
                break
            case .errorCodeWeakPassword:
                message = NSLocalizedString("Password is not strong enough", comment: "")
                break
            /**
             *  Forgot Password.
             */
            case .errorCodeUserNotFound:
                message = NSLocalizedString("This email doesn’t appear to exist in our system", comment: "")
                break
            /**
             *  General
             */
            case .errorCodeOperationNotAllowed:
                message = NSLocalizedString("Network error", comment: "")
                break
            case .errorCodeNetworkError:
                message = NSLocalizedString("Network error", comment: "")
                break
            default:
                message = NSLocalizedString("Network error", comment: "")
                break
        }
        
        APAlert.top(message)
    }
}


/**
 *  Helper funcs.
 */
extension Error {
    /**
     *  Bridges to NSError.
     */
    var userInfo: [String:AnyObject] {
        get {
            return (self as NSError).userInfo
        }
    }
}
