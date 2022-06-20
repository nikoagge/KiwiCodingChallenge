//
//  UIFont+Extension.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import UIKit

extension UIFont {
    static func makeSystem(_ fontSize: CGFloat, _ weight: Weight) -> UIFont {
        return UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
}
