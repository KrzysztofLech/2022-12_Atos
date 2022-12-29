//  Strings.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal enum Strings {
    internal static let alertActionOkTitle = "OK"

    internal enum LoginScreen {
        internal static let loginPlaceholder = "Login"
        internal static let passwordPlaceholder = "Password"
        internal static let loginButtonTitle = "LOG IN"

        internal enum Errors {
            internal static let emptyFieldsTitle = "Login and Password\nmust not be empty"
            internal static let wrongCredentialsTitle = "Wrong credentials"
            internal static let message = "Login failed!"
        }
    }

    internal enum MainScreen {
        internal static let backButtonTitle = "Back"
        internal static let mainScreenTitle = "News's for %@"

        internal enum Errors {
            internal static let apiProblemTitle = "Downloading data problem"
            internal static let apiProblemMessage = "Let's try again"
        }
    }

    internal enum UserScreen {
        internal static let nameTitle = "Name:"
        internal static let lastLoginTitle = "Last login:"
    }
}
