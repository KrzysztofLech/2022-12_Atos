//  SceneDelegate.swift
//  Created by Krzysztof Lech on 28/12/2022.

import UIKit

internal class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private var rootCoordinator: RootCoordinator?

    internal var window: UIWindow?

    internal func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        rootCoordinator = RootCoordinator(windowScene: windowScene)
        rootCoordinator?.start()
    }
}
