//  RootCoordinator.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal protocol Coordinator {
    func start()
}

internal final class RootCoordinator: NSObject, Coordinator {
    private let window: UIWindow

    private var loginViewController: UIViewController?

    // MARK: - Init -

    internal init(windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)
    }

    // MARK: - Scenes methods -

    internal func start() {
        window.makeKeyAndVisible()
        showRelevantModule()
    }

    private func showRelevantModule() {
        showLoginScreen()
    }

    private func showLoginScreen() {
        loginViewController = LoginViewController()
        window.set(rootViewController: loginViewController)
    }
}
