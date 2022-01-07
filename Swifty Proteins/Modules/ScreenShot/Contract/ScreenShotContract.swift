// 
//  ScreenShotContract.swift
//  Swifty Proteins
//
//  Created by 19733654 on 07.01.2022.
//

import UIKit

// MARK: - View Input (Presenter -> View)
protocol ScreenShotViewInput: AnyObject {
	func setImage(_ image: UIImage)
	func showError(_ message: String)
	func showMessage(title: String, text: String)
}

// MARK: - View Output (View -> Presenter)
protocol ScreenShotViewOutput: AnyObject {
    func viewDidLoad()
	func shareButtonTapped(_ view: ScreenShotViewInput, title: String?, text: String?)
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol ScreenShotInteractorInput: AnyObject {}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol ScreenShotInteractorOutput: AnyObject {}

// MARK: - Router Input (Presenter -> Router)
protocol ScreenShotRouterInput: AnyObject {
	func routeToActivity(items: [Any])
}

// MARK: - DataSource Input (Presenter -> DataSource)
protocol ScreenShotDataSourceInput: UITableViewDataSource {
    func updateForSections(_ sections: [SectionProtocol])
}

// MARK: - Cell Output (Cell -> Presenter)
protocol ScreenShotCellOutput: AnyObject {}
