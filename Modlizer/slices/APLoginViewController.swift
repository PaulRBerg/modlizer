//
//  APLoginNetwork.swift
//  Modlizer
//
//  Created by Paul Berg on 17/07/2017.
//  Copyright © 2017 Paul Berg. All rights reserved.
//

import UIKit

class APLoginViewController: UIViewController {

    /**
     *  The views which let the user type the email and the password.
     */
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    /**
     *  Override 'viewDidLoad'.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**
         *  @located in APLoginTextFieldController.swift
         */
        appendTextField()
    }

    /**
     *  Override 'viewWillAppear'.
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    /**
     *  Override 'didReceiveMemoryWarning'.
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
