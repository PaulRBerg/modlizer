//
//  APLoginTextFieldController.swift
//  Modlizer
//
//  Created by Paul Berg on 17/07/2017.
//  Copyright © 2017 Paul Berg. All rights reserved.
//

import UIKit

extension APLoginViewController: UITextFieldDelegate {
    
    /**
     *  Append the fully configured text fields to the view controller.
     */
    func appendTextField() {
        // Private method, not available for Modlizer.
    }
    
    /**
     *  The text field delegate.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }
        
        if textField == passwordTextField {
            didTapSignInButton(textField)
        }
        return true
    }
    
    /**
     *  Called when the background was tapped.
     */
    @IBAction func didTapBackground(_ sender: Any) {
        view.endEditing(true)
    }
}
