//
//  ScreenShotAssembly.swift
//  Swifty Proteins
//
//  Created by 19733654 on 07.01.2022.
//  
//

import UIKit

enum ScreenShotAssembly{
    // MARK: Static methods
	static func createModule(image: UIImage) -> UIViewController {
        let router = ScreenShotRouter()
        let interactor = ScreenShotInteractor()
        let presenter = ScreenShotPresenter(
            interactor: interactor,
            router: router,
			image: image
        )
        let view = ScreenShotView(presenter: presenter)
        presenter.view = view
        router.view = view
		interactor.presenter = presenter
        return view
    }
}
