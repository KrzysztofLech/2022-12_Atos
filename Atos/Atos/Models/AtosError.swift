//  AtosError.swift
//  Created by Krzysztof Lech on 29/12/2022.

import Foundation

internal enum AtosErrorType {
    case emptyLoginField, wrongCredentials

    internal var title: String {
        switch self {
        case .emptyLoginField:
            return Strings.LoginScreen.Errors.emptyFieldsTitle
        case .wrongCredentials:
            return Strings.LoginScreen.Errors.wrongCredentialsTitle
        }
    }

    internal var message: String {
        switch self {
        case .emptyLoginField, .wrongCredentials:
            return Strings.LoginScreen.Errors.message
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
