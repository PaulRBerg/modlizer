//
//  APLoginNetwork.swift
//  Modlizer
//
//  Created by Paul Berg on 17/07/2017.
//  Copyright © 2017 Paul Berg. All rights reserved.
//

import UIKit

extension CALayer {
    var borderUIColor: UIColor {
        set {
            self.borderColor = newValue.cgColor
        }
        
        get {
            return UIColor(cgColor: self.borderColor!)
        }
    }
}
