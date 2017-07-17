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

extension APLoginViewController {
    
    /**
     *  Simply logins the user using the classic email & password.
     */
    func login() {
        APAlert.top(NSLocalizedString("Sample app, can't login", comment: ""))
        return;
            
        MBProgressHUD.showAdded(to: self.view, animated: true)
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!,
                               password: passwordTextField.text!,
                               completion: { [unowned self] (user, error) in
                                self.handleResponse(error: error)
        })
    }
    
    /**
     *  Handles the response of the request made above. We're  going to the playground.
     */
    fileprivate func handleResponse(error: Error?) {
        MBProgressHUD.hide(for: self.view, animated: true)
        if error != nil {
            APError.credential(error!)
            return
        }
        
        /**
         *  The user is not successfully logged in until the email is verified.
         */
        if !FIRAuth.auth()!.currentUser!.isEmailVerified {
            APIntent.gotoEmailVerification(sender: self)
            return
        }
        APIntent.gotoPlayground(sender: self)
    }
}
