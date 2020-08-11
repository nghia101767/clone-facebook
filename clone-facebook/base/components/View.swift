//
//  View.swift
//  clone-facebook
//
//  Created by Nghia Nguyen on 11/08/2020.
//  Copyright © 2020 Nghia Nguyen. All rights reserved.
//

import UIKit

@IBDesignable
class View: UIView{
    @IBInspectable
    var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
}
