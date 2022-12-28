//  UIWindow+extensions.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

extension UIWindow {
    internal func set(rootViewController: UIViewController?, animated: Bool = true, completion: (() -> Void)? = nil) {
        self.rootViewController = rootViewController

        guard animated else {
            completion?()
            return
        }
        
        UIView.transition(
            with: self,
            duration: 0.3,
            options: [.transitionCrossDissolve],
            animations: {},
            completion: { _ in
                completion?()
            }
        )
    }
}
