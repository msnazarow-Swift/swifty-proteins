// 
//  ProteinListRouter.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinListRouter {
    // MARK: - Properties
    weak var view: UIViewController?
}

// MARK: - Router Input (Presenter -> Router)
extension ProteinListRouter: ProteinListRouterInput {
	func routeToProtein(_ protein: String) {
		view?.navigationController?.pushViewController(ProteinAssembly.createModule(protein: protein), animated: true)
	}
}
