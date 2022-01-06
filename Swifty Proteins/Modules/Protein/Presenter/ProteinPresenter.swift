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
	let protein: String

    // MARK: Init
    init(
        interactor: ProteinInteractorInput,
        router: ProteinRouterInput,
        dataSource: ProteinDataSourceInput,
		protein: String
    ) {
        self.interactor = interactor
        self.router = router
        self.dataSource = dataSource
		self.protein = protein
    }
}

// MARK: - View Output (View -> Presenter)
extension ProteinPresenter: ProteinViewOutput {
	func viewDidLoad() {
        interactor.getMolecule(name: protein)
    }
}

// MARK: - Cell Output (Cell -> Presenter)
extension ProteinPresenter: ProteinCellOutput {}

// MARK: - Interactor Output (Interactor -> Presenter)
extension ProteinPresenter: ProteinInteractorOutput {
    func presentMolecule(_ molecule: Molecule) {
        view?.showMolecule(molecule)
    }
}
