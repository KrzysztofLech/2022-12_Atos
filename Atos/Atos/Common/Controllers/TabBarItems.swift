//  TabBarItems.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

import UIKit

internal enum TabBarItem: Int, CaseIterable {
    case main
    case user

    private var iconImage: UIImage? {
        switch self {
        case .main:
            return UIImage(named: "MainScreen_icon")
        case .user:
            return UIImage(named: "UserScreen_icon")
        }
    }

    internal var item: UITabBarItem {
        let item = UITabBarItem()
        item.title = nil
        item.image = iconImage
        item.tag = self.rawValue
        return item
    }
}
