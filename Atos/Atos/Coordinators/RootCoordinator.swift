//  RootCoordinator.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal protocol Coordinator {
    func start()
}

internal final class RootCoordinator: NSObject, Coordinator {
    private let window: UIWindow

    private var userService: UserServiceProtocol?

    private var loginViewController: UIViewController?
    private var tabBarController: TabBarController?
    private var mainViewNavigationController: UINavigationController?

    // MARK: - Init -

    internal init(windowScene: UIWindowScene) {
        self.window = UIWindow(windowScene: windowScene)
    }

    // MARK: - Scenes methods -

    internal func start() {
        window.makeKeyAndVisible()
        showLoginScreen()
    }

    private func showLoginScreen() {
        let viewModel = LoginViewModel()
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
        guard let userService else { return }

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
        let userViewModel = UserViewModel(userService: userService)
        let userViewController = UserViewController(viewModel: userViewModel)
        let userViewNavigationController = UINavigationController(rootViewController: userViewController)
        userViewController.tabBarItem = TabBarItem.user.item

        tabBarController = TabBarController()
        tabBarController?.viewControllers = [mainViewNavigationController, userViewNavigationController]
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
    internal func logged(with user: User) {
        userService = UserService(user: user)
        showMainScreen() { [weak self] in
            self?.loginViewController = nil
        }
    }

    internal func loginWithError(_ error: AtosError) {
        let alerController = UIAlertController(
            title: error.title,
            message: error.message,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: Strings.alertActionOkTitle, style: .default)
        alerController.addAction(alertAction)

        loginViewController?.present(alerController, animated: true)
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
