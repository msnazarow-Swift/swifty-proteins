// 
//  ProteinRouter.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinRouter {
    // MARK: - Properties
    weak var view: UIViewController?
}

// MARK: - Router Input (Presenter -> Router)
extension ProteinRouter: ProteinRouterInput {
	func routeToActivity(image: UIImage) {
		let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
		guard let view = view else { return }
		activityVC.popoverPresentationController?.sourceView = view.view
		view.present(activityVC, animated: true)
	}
}
