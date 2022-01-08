// 
//  ScreenShotPresenter.swift
//  Swifty Proteins
//
//  Created by 19733654 on 07.01.2022.
//

import UIKit

class ScreenShotPresenter {
    // MARK: Properties
    weak var view: ScreenShotViewInput?
    let interactor: ScreenShotInteractorInput
    let router: ScreenShotRouterInput
	let image: UIImage

    // MARK: Init
	init(
		interactor: ScreenShotInteractorInput,
		router: ScreenShotRouterInput,
		image: UIImage
	) {
        self.interactor = interactor
        self.router = router
		self.image = image
    }
}

// MARK: - View Output (View -> Presenter)
extension ScreenShotPresenter: ScreenShotViewOutput {
	func viewDidLoad() {
		view?.setImage(image)
	}

	func shareButtonTapped(_ view: ScreenShotViewInput, title: String?, text: String?) {
		router.routeToActivity(items: [view, image])
	}
}


// MARK: - Cell Output (Cell -> Presenter)
extension ScreenShotPresenter: ScreenShotCellOutput {}

// MARK: - Interactor Output (Interactor -> Presenter)
extension ScreenShotPresenter: ScreenShotInteractorOutput {}
