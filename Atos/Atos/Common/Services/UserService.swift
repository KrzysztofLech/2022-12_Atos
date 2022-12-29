//  UserService.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal protocol UserServiceProtocol {
    var isLogged: Bool { get set }
    var name: String { get }
}

internal class UserService: UserServiceProtocol {
    internal var isLogged: Bool

    internal var name = "UserName"

    internal init() {
        self.isLogged = false
    }
}

internal struct User {
    internal let login: String
    internal let password: String
}

extension User {
    internal static let authorizedUsers: [User] = [
        .init(login: "Admin", password: "Admin1234"),
        .init(login: "Kasia", password: "Kasia1234")
    ]

    internal var isNotAuthorized: Bool {
        let users = User.authorizedUsers.filter { authorizedUser in
            authorizedUser.login.lowercased() == login.lowercased() && authorizedUser.password == password
        }
        return users.isEmpty
    }
}
