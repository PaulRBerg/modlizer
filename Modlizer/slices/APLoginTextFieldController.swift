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
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imageView.image = UIImage(named: "ic_question_mark")
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(APLoginViewController.didTapForgotPasswordButton)))
        passwordTextField.rightViewMode = .always
        passwordTextField.rightView = imageView
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
