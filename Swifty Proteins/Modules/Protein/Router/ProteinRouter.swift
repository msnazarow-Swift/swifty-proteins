// 
//  ProteinRouter.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinRouter {
    // MARK: - Properties
    weak var view: (UIViewController & ProteinViewInput)?
}

// MARK: - Router Input (Presenter -> Router)
extension ProteinRouter: ProteinRouterInput {
	func routeToScreenShot(image: UIImage) {
		view?.navigationController?.pushViewController(ScreenShotAssembly.createModule(image: image), animated: true)
	}
}
