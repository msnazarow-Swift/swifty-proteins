// 
//  ProteinPresenter.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import Foundation

class ProteinPresenter {

    // MARK: Properties
    weak var view: ProteinViewInput?
    let interactor: ProteinInteractorInput
    let router: ProteinRouterInput
    let dataSource: ProteinDataSourceInput

    // MARK: Init
    init(
        interactor: ProteinInteractorInput,
        router: ProteinRouterInput,
        dataSource: ProteinDataSourceInput
    ) {
        self.interactor = interactor
        self.router = router
        self.dataSource = dataSource
    }
}

// MARK: - View Output (View -> Presenter)
extension ProteinPresenter: ProteinViewOutput {
	func viewDidLoad() {}
}

// MARK: - Cell Output (Cell -> Presenter)
extension ProteinPresenter: ProteinCellOutput {}

// MARK: - Interactor Output (Interactor -> Presenter)
extension ProteinPresenter: ProteinInteractorOutput {}
