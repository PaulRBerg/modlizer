//
//  APLoginNetwork.swift
//  Modlizer
//
//  Created by Paul Berg on 17/07/2017.
//  Copyright © 2017 Paul Berg. All rights reserved.
//

import UIKit
import CWStatusBarNotification

/**
 *  A helper to class to usually present alerts throughout the app.
 */

private var negative = APColor.highlight
private var positive = APColor.green

class APAlert {
    
    /**
     *  Basic highlighted notification which appears in the top of the page. Uses a default value of 3.5 seconds.
     *  The default color is the `highlight` which is a kind of grena, a darker red.
     */
    class func top(_ message: String) {
        top(message, color: negative)
    }
    
    class func top(_ message: String, isPositive: Bool) {
        top(message, color: isPositive ? positive : negative)
    }
    
    
    /**
     *  Displays a top positive notification.
     */
    class func top(_ message: String, color: UIColor) {
        let notification = CWStatusBarNotification()
        notification.notificationLabelBackgroundColor = color
        notification.notificationStyle = .navigationBarNotification
        notification.display(withMessage: message, forDuration: 3.5)
    }
    
    
    /**
     *  Displaying an actual alert controller in the center of the top most view controller. The default button is "Ok" and it simply dismisses the alert controller
     */
    class func centerAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        UIApplication.topViewController()?.present(alertController, animated: true, completion: nil)
    }
}
