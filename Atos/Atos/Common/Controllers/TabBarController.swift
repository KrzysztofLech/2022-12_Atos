//  TabBarController.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal protocol TabBarControllerProtocol: AnyObject {

}

internal class TabBarController: UITabBarController, TabBarControllerProtocol {
    override internal func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
    }

    private func setupAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()

        tabBarItemAppearance.normal.iconColor = .Atos.black
        tabBarItemAppearance.selected.iconColor = .Atos.white

        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = .Atos.background
        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance

        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
}
