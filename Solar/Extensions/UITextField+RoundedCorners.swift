//
//  UITextField+RoundedCorners.swift
//  VisiGO
//
//  Created by Enkefa on 17.03.2020.
//  Copyright © 2020 Enkefa. All rights reserved.
//

import Foundation
import UIKit

class RoundTextField: UITextField {

    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable public var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var leftInset:CGFloat = 0 {
           didSet {
               commonInit()
           }
       }
       @IBInspectable var rightInset:CGFloat = 0 {
           didSet {
               commonInit()
           }
       }
       
       var padding:UIEdgeInsets!
       
       override init(frame:CGRect) {
           super.init(frame:frame)
           commonInit()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           commonInit()
       }
       
       private func commonInit() {
               padding = UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
       }
       
       override open func textRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: padding)
       }
       override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: padding)
       }
       override open func editingRect(forBounds bounds: CGRect) -> CGRect {
           return bounds.inset(by: padding)
       }
    
}
