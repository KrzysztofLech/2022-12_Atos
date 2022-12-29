//  UserService.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal protocol UserServiceProtocol {
    var name: String { get }
    var imageName: String { get }
    var lastLoginDate: String { get }
}

internal class UserService: UserServiceProtocol {
    private let user: User
    private let loginDate: Date

    internal init(user: User) {
        self.user = user
        self.loginDate = Date()
    }

    internal var name: String {
        return user.login
    }

    internal var imageName: String {
        return user.imageName
    }

    internal var lastLoginDate: String {
        let formatter = DateFormatter.atosDate
        return formatter.string(from: loginDate)
    }
}
