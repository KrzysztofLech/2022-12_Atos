//  LoginViewModel.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal protocol LoginViewModelProtocol {
    var loginPlaceholder: String { get }
    var passwordPlaceholder: String { get }
    var loginButtonTitle: String { get }
    func login(login: String?, password: String?, completion: (Result<User, AtosError>) -> Void)
}

internal class LoginViewModel: LoginViewModelProtocol {
    internal let loginPlaceholder = Strings.LoginScreen.loginPlaceholder
    internal let passwordPlaceholder = Strings.LoginScreen.passwordPlaceholder
    internal let loginButtonTitle = Strings.LoginScreen.loginButtonTitle

    internal func login(login: String?, password: String?, completion: (Result<User, AtosError>) -> Void) {
        guard let login, let password, !login.isEmpty, !password.isEmpty else {
            completion(.failure(AtosErrorType.emptyLoginField.error))
            return
        }

        let user = User(login: login, password: password)
        guard !user.isNotAuthorized else {
            completion(.failure(AtosErrorType.wrongCredentials.error))
            return
        }

        completion(.success(user))
    }
}
