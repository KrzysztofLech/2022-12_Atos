//  SceneDelegate.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var rootCoordinator: RootCoordinator?

    internal var window: UIWindow?

    internal func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        setupNavigationBar()
        rootCoordinator = RootCoordinator(windowScene: windowScene)
        rootCoordinator?.start()
    }
}

private extension SceneDelegate {
    func setupNavigationBar() {
        let appAppearance = UINavigationBar.appAppearance()
        UINavigationBar.appearance().standardAppearance = appAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = appAppearance
        UINavigationBar.appearance().compactAppearance = appAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = appAppearance
    }
}
