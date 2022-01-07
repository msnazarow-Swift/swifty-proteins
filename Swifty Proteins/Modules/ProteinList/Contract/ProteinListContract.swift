// 
//  ProteinListContract.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

// MARK: - View Input (Presenter -> View)
protocol ProteinListViewInput: AnyObject {
	func tableViewReload()
	func showError(_ error: String)
}

// MARK: - View Output (View -> Presenter)
protocol ProteinListViewOutput: AnyObject {
    var dataSource: ProteinListDataSourceInput { get }

	func updateSearchResults(_ view: ProteinListViewInput, text: String?)
    func viewDidLoad(_ view: ProteinListViewInput)
	func randomButtonTapped(_ view: ProteinListViewInput)
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol ProteinListInteractorInput: AnyObject {}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol ProteinListInteractorOutput: AnyObject {}

// MARK: - Router Input (Presenter -> Router)
protocol ProteinListRouterInput: AnyObject {
	func routeToProtein(_ protein: String)
}

// MARK: - DataSource Input (Presenter -> DataSource)
protocol ProteinListDataSourceInput: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func updateForSections(_ sections: [SectionProtocol])
	func updateForHeaders(_ headers: [ProteinListHeaderModel])
}

// MARK: - DataSource Input (DataSource -> Presenter)
protocol ProteinListDataSourceOutput {
	func didSelectProtein(_ protein: ProteinListCellModel)
}

// MARK: - Cell Output (Cell -> Presenter)
protocol ProteinListCellOutput: CellOutput {}
