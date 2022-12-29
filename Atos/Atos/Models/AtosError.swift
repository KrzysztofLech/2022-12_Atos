//  AtosError.swift
//  Created by Krzysztof Lech on 29/12/2022.

import Foundation

internal enum AtosErrorType {
    case emptyLoginField, wrongCredentials, networking

    internal var title: String {
        switch self {
        case .emptyLoginField:
            return Strings.LoginScreen.Errors.emptyFieldsTitle
        case .wrongCredentials:
            return Strings.LoginScreen.Errors.wrongCredentialsTitle
        case .networking:
            return Strings.MainScreen.Errors.apiProblemTitle
        }
    }

    internal var message: String {
        switch self {
        case .emptyLoginField, .wrongCredentials:
            return Strings.LoginScreen.Errors.message
        case .networking:
            return Strings.MainScreen.Errors.apiProblemMessage
        }
    }

    internal var error: AtosError {
        return AtosError(title: title, message: message)
    }
}

internal struct AtosError: Error {
    let title: String
    let message: String
}
