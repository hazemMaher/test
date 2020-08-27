//
//  UIImageView+Extensions.swift
//  Momox
//
//  Created by Hazem Maher on 16.07.20.
//  Copyright © 2020 Hazem Maher. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRounded() {
        layer.cornerRadius = bounds.size.width / 2
        layer.masksToBounds = true
    }
}
