//
//  UIStackView+BackgroundColor.swift
//  VisiGO
//
//  Created by Enkefa on 13.03.2020.
//  Copyright © 2020 Enkefa. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class StackView: UIStackView {
   @IBInspectable private var color: UIColor?
    
    override var backgroundColor: UIColor? {
        get { return color }
        set {
            color = newValue
            self.setNeedsLayout()
        }
    }

    private lazy var backgroundLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        self.layer.insertSublayer(layer, at: 0)
        return layer
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundLayer.path = UIBezierPath(rect: self.bounds).cgPath
        backgroundLayer.fillColor = self.backgroundColor?.cgColor
    }
    
    
}
