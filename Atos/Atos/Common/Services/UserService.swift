//  UserService.swift
//  Created by Krzysztof Lech on 28/12/2022.

import Foundation

internal protocol UserServiceProtocol {
    var isLogged: Bool { get set }
}

internal class UserService: UserServiceProtocol {
    internal var isLogged: Bool

    internal init() {
        self.isLogged = false
    }
}
