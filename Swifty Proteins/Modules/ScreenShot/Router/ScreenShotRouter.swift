// 
//  ScreenShotRouter.swift
//  Swifty Proteins
//
//  Created by 19733654 on 07.01.2022.
//

import UIKit

class ScreenShotRouter {
    // MARK: - Properties
    weak var view: (UIViewController & ScreenShotViewInput)?
}

// MARK: - Router Input (Presenter -> Router)
extension ScreenShotRouter: ScreenShotRouterInput {
	func routeToActivity(items: [Any]) {
		let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
		guard let view = view else { return }
		activityVC.completionWithItemsHandler = { (type, success, items, error) in
			if let error = error {
				view.showError(error.localizedDescription)
			} else if success {
				view.showMessage(title: "Успешно", text: "Скриншот отправлен")
			}
		}
		activityVC.popoverPresentationController?.sourceView = view.view
		activityVC.popoverPresentationController?.barButtonItem = view.navigationItem.rightBarButtonItem
		view.present(activityVC, animated: true)
	}
}
