//
//  ReusableView.swift
//  KiwiCodingChallenge
//
//  Created by Nikos Aggelidis on 19/6/22.
//

import UIKit

protocol ReusableViewDelegate: AnyObject {
    static var reusableIdentifier: String { get }
    static var nib: UINib { get }
}

extension ReusableViewDelegate where Self: UIView {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: reusableIdentifier, bundle: nil)
    }
}
