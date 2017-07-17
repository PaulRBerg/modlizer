//
//  APLoginNetwork.swift
//  Modlizer
//
//  Created by Paul Berg on 17/07/2017.
//  Copyright © 2017 Paul Berg. All rights reserved.
//

import UIKit

class APConstant {
    
    /**
        App related constants.
     */
    static let kAPAppName = "Modlizer"

    /**
        Error responses.
     */
    static let kAPAppError = NSLocalizedString("Error occurred", comment: "")
    static let kAPAppErrorInternet = NSLocalizedString("Network error", comment: "")
    
    /**
        Storyboard names.
     */
    static let kAPCredentialStoryboard = "Credential"
    static let kAPForgotPasswordStoryboard = "ForgotPassword"
    static let kAPPlaygroundStoryboard = "Playground"
    
    /**
        View controller ID's from the Storyboard.
     */
    static let kAPLoginController = "loginController"
    static let kAPSignUpController = "signUpController"
    static let kAPEmailVerificationController = "emailVerificationController"
    static let kAPForgotPasswordController = "forgotPasswordController"
    static let kAPForgotPasswordSuccessViewController = "forgotPasswordSuccessController"
    
}
