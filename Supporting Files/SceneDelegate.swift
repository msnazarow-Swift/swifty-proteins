//
//  SceneDelegate.swift
//  Swifty Proteins
//
//  Created by Clothor- on 12/26/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: windowScene)
		let navigation = UINavigationController(rootViewController: AuthentificationAssembly.createModule())
		navigation.setNavigationBarHidden(true, animated: true)
		navigation.view.backgroundColor = .clear
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}
