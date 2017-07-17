//
//  APLoginNetwork.swift
//  Modlizer
//
//  Created by Paul Berg on 17/07/2017.
//  Copyright © 2017 Paul Berg. All rights reserved.
//

import UIKit

extension APLoginViewController {
    
    /**
     *  Called when the 'Sign In' (middle) button was tapped.
     */
    @IBAction func didTapSignInButton(_ sender: Any) {
        view.endEditing(true)
        
        /**
         *  We proceed to sign up the user only if all the requirements are met.
         */
        if !isDataValid() {
            return
        }
        login()
    }
    
    /**
     *  Called when the small 'Forgot Password' (to the right of password field) button was tapped.
     */
    func didTapForgotPasswordButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: APConstant.kAPForgotPasswordStoryboard, bundle: nil)
        let forgotPasswordViewController = storyboard.instantiateInitialViewController()!
        navigationController!.show(forgotPasswordViewController, sender: self)
    }
    
    /**
     *  Called when the 'Forgot Password?' (bottom of the page) button was tapped.
     */
    @IBAction func didTapForgotPasswordLabel(_ sender: Any) {
        didTapForgotPasswordButton(sender)
    }
}
