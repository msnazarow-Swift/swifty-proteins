// 
//  ProteinListPresenter.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import Foundation

class ProteinListPresenter {

    // MARK: Properties
    weak var view: ProteinListViewInput?
    let interactor: ProteinListInteractorInput
    let router: ProteinListRouterInput
    let dataSource: ProteinListDataSourceInput

    // MARK: Init
    init(
        interactor: ProteinListInteractorInput,
        router: ProteinListRouterInput,
        dataSource: ProteinListDataSourceInput
    ) {
        self.interactor = interactor
        self.router = router
        self.dataSource = dataSource
    }
}

// MARK: - View Output (View -> Presenter)
extension ProteinListPresenter: ProteinListViewOutput {
	func viewDidLoad() {}
}

// MARK: - Cell Output (Cell -> Presenter)
extension ProteinListPresenter: ProteinListCellOutput {}

// MARK: - Interactor Output (Interactor -> Presenter)
extension ProteinListPresenter: ProteinListInteractorOutput {}
