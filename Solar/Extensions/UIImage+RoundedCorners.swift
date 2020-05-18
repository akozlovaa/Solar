//
//  UIImage+RoundedCorners.swift
//  VisiGO
//
//  Created by Enkefa on 25.02.2020.
//  Copyright © 2020 Enkefa. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    override init(image: UIImage?) {
        super.init(image: image)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBInspectable var cornerRadius: CGFloat = 0{
         didSet{
         self.layer.cornerRadius = cornerRadius
         }
     }
    
}
