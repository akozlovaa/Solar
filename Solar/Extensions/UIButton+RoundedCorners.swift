//
//  RoundButton.swift
//  VisiGO
//
//  Created by Enkefa on 19.01.2020.
//  Copyright © 2020 Enkefa. All rights reserved.
//

import UIKit
import Foundation

@IBDesignable
class RoundButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: CGColor? {
        didSet {
            self.layer.borderColor = CGColor.self as! CGColor        }
    }
    
}
