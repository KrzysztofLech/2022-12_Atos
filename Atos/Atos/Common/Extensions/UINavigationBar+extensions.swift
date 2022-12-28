//  UINavigationBar+extensions.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

extension UINavigationBar {
    internal static func appAppearance() -> UINavigationBarAppearance {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .Atos.background

        let textColor = UIColor.Atos.white ?? .white
        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: textColor,
            .font: UIFont.systemFont(ofSize: 27, weight: .medium)
        ]
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: textColor,
            .font: UIFont.systemFont(ofSize: 17, weight: .medium)
        ]

        let icon = UIImage(named: "BlankImage")
        navBarAppearance.setBackIndicatorImage(icon, transitionMaskImage: icon)

        let backButtonAppearance = UIBarButtonItemAppearance()
        let backButtonColor = UIColor.Atos.backButton ?? .green
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: backButtonColor,
            .font: UIFont.systemFont(ofSize: 17, weight: .light)
        ]
        backButtonAppearance.normal.titleTextAttributes = attributes
        backButtonAppearance.disabled.titleTextAttributes = attributes
        backButtonAppearance.highlighted.titleTextAttributes = attributes
        backButtonAppearance.focused.titleTextAttributes = attributes

        navBarAppearance.backButtonAppearance = backButtonAppearance
        return navBarAppearance
    }
}
