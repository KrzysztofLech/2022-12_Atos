//  LoginViewModel.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal protocol LoginViewModelProtocol {
    func login(completion: () -> Void)
}

internal class LoginViewModel: LoginViewModelProtocol {
    private var userService: UserServiceProtocol

    internal init(userService: UserServiceProtocol) {
        self.userService = userService
    }

    internal func login(completion: () -> Void) {
        userService.isLogged = true
        completion()
    }
}
