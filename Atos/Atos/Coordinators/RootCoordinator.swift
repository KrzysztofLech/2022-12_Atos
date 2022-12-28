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
    private var tabBarController: TabBarController?
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

    private func showMainScreen(completion: (() -> Void)? = nil) {
        setupTabBarController()
        guard let tabBarController else { return }
        window.set(rootViewController: tabBarController, completion: completion)
    }

    private func setupTabBarController() {
        // Main screen
        let mainViewModel = MainViewModel(userService: userService)
        let mainViewController = MainViewController(
            viewModel: mainViewModel,
            delegate: self
        )
        let mainViewNavigationController = UINavigationController(rootViewController: mainViewController)
        self.mainViewNavigationController = mainViewNavigationController
        mainViewController.tabBarItem = TabBarItem.main.item

        // User screen
        let userViewModel = UserViewModel()
        let userViewController = UserViewController(viewModel: userViewModel)
        userViewController.tabBarItem = TabBarItem.user.item

        tabBarController = TabBarController()
        tabBarController?.viewControllers = [mainViewNavigationController, userViewController]
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
        showMainScreen() { [weak self] in
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
