//  LoginViewModel.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal protocol LoginViewModelProtocol {
    var loginPlaceholder: String { get }
    var passwordPlaceholder: String { get }
    var loginButtonTitle: String { get }
    func login(login: String?, password: String?, completion: (AtosError?) -> Void)
}

internal class LoginViewModel: LoginViewModelProtocol {
    private var userService: UserServiceProtocol

    internal init(userService: UserServiceProtocol) {
        self.userService = userService
    }

    internal let loginPlaceholder = Strings.LoginScreen.loginPlaceholder
    internal let passwordPlaceholder = Strings.LoginScreen.passwordPlaceholder
    internal let loginButtonTitle = Strings.LoginScreen.loginButtonTitle

    internal func login(login: String?, password: String?, completion: (AtosError?) -> Void) {
        guard let login, let password, !login.isEmpty, !password.isEmpty else {
            completion(AtosErrorType.emptyLoginField.error)
            return
        }

        let user = User(login: login, password: password)
        guard !user.isNotAuthorized else {
            completion(AtosErrorType.wrongCredentials.error)
            return
        }

        userService.isLogged = true
        completion(nil)
    }
}
