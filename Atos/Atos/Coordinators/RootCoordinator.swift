//  RootCoordinator.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal protocol Coordinator {
    func start()
}

internal final class RootCoordinator: NSObject, Coordinator {
    private let window: UIWindow

    private let userService: UserServiceProtocol

    private var loginViewController: UIViewController?
    private var mainViewNavigationController: UINavigationController?

    // MARK: - Init -

    internal init(windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)
        self.userService = UserService()
    }

    // MARK: - Scenes methods -

    internal func start() {
        window.makeKeyAndVisible()
        showLoginScreen()
    }

    private func showLoginScreen() {
        let viewModel = LoginViewModel(userService: userService)
        loginViewController = LoginViewController(
            viewModel: viewModel,
            delegate: self
        )
        window.set(rootViewController: loginViewController)
    }

    private func shoWMainScreen(completion: (() -> Void)? = nil) {
        let viewModel = MainViewModel()
        let mainViewController = MainViewController(
            viewModel: viewModel,
            delegate: self
        )
        mainViewNavigationController = .init(rootViewController: mainViewController)
        window.set(rootViewController: mainViewNavigationController, completion: completion)
    }

    private func showDetailsScreen() {
        let viewModel = DetailsViewModel()
        let detailsViewController = DetailsViewController(
            viewModel: viewModel,
            delegate: self
        )

        mainViewNavigationController?.pushViewController(detailsViewController, animated: true)
    }

    private func hideDetailsScreen() {
        print("Close")
    }
}

extension RootCoordinator: LoginViewControllerDelegate {
    internal func logged() {
        shoWMainScreen() { [weak self] in
            self?.loginViewController = nil
        }
    }
}

extension RootCoordinator: MainViewControllerDelegate {
    internal func showDetails() {
        showDetailsScreen()
    }
}

extension RootCoordinator: DetailsViewControllerDelegate {
    internal func close() {
        hideDetailsScreen()
    }
}
