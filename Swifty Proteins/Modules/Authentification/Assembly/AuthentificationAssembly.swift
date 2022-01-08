//
//  AuthentificationAssembly.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit

enum AuthentificationAssembly {
    // MARK: Static methods
    static func createModule() -> UIViewController {
        let viewController = AuthentificationViewController()
        let router = AuthentificationRouter(view: viewController)
        let presenter = AuthentificationPresenter(
			view: viewController,
			router: router
		)
        viewController.presenter = presenter
        return viewController
    }
}
