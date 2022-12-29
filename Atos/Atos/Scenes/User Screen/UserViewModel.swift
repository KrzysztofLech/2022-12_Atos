//  UserViewModel.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal protocol UserViewModelProtocol {
    var title: String { get }
    var userImageName: String { get }
    var userNameTitle: String { get }
    var userName: String { get }
    var lastLoginTitle: String { get }
    var lastLoginDate: String { get }
}

internal class UserViewModel: UserViewModelProtocol {
    private let userService: UserServiceProtocol

    internal init(userService: UserServiceProtocol) {
        self.userService = userService
    }

    internal var title: String {
        return userService.name
    }

    internal var userImageName: String {
        return userService.imageName
    }

    internal let userNameTitle = Strings.UserScreen.nameTitle

    internal var userName: String {
        return userService.name
    }

    internal let lastLoginTitle = Strings.UserScreen.lastLoginTitle

    internal var lastLoginDate: String {
        return userService.lastLoginDate
    }
}
