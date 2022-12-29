//  UIView+extensions.swift
//  Created by Krzysztof Lech on 29/12/2022.

import UIKit

extension UIView {
    static var className: String {
        return String(describing: self)
    }
}
