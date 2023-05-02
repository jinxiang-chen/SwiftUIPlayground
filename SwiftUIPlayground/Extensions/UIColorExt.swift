//
//  UIColorExt.swift
//  SwiftUIPlayground
//
//  Created by Fu on 2023/5/1.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let redValue = CGFloat(red) / 255
        let greenValue = CGFloat(red) / 255
        let blueValue = CGFloat(red) / 255
        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }
}
