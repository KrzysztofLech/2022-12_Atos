//  MainViewModel.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal protocol MainViewModelProtocol {
    var title: String { get }
    var backButtonTitle: String { get }
}

internal class MainViewModel: MainViewModelProtocol {
    private let userService: UserServiceProtocol

    internal init(userService: UserServiceProtocol) {
        self.userService = userService
    }

    internal var title: String {
        return String(format: Strings.MainScreen.mainScreenTitle, userService.name)
    }

    internal var backButtonTitle: String {
        return Strings.MainScreen.backButtonTitle
    }
}
