//
//  AuthentificationRouter.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit

class AuthentificationRouter: PresenterToRouterAuthentificationProtocol {

    // MARK: - Properties
    weak var view: UIViewController!

    // MARK: - Init
    init(view: UIViewController) {
        self.view = view
    }

    func routeToMain() {
//        DispatchQueue.main.async {
//            self.view.navigationController?.setViewControllers([DiaryAssembly.createModule()], animated: true)
//        }
    }
}
