// 
//  ProteinPresenter.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinPresenter {
    // MARK: Properties
    weak var view: ProteinViewInput?
    let interactor: ProteinInteractorInput
    let router: ProteinRouterInput
	let protein: String

    // MARK: Init
    init(
		interactor: ProteinInteractorInput,
		router: ProteinRouterInput,
		protein: String
    ) {
        self.interactor = interactor
        self.router = router
		self.protein = protein
    }
}

// MARK: - View Output (View -> Presenter)
extension ProteinPresenter: ProteinViewOutput {
	func viewDidLoad(_ view: ProteinViewInput) {
		view.setTitle(protein)
        interactor.getMolecule(name: protein)
        interactor.getElementsInfo()
    }

	func shareButtonTapped(_ view: ProteinViewInput, image: UIImage) {
		router.routeToScreenShot(image: image)
	}
}

// MARK: - Cell Output (Cell -> Presenter)
extension ProteinPresenter: ProteinCellOutput {}

// MARK: - Interactor Output (Interactor -> Presenter)
extension ProteinPresenter: ProteinInteractorOutput {
    func reciveError(_ error: Error) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view?.showError(error.localizedDescription)
        }
    }

    func presentMolecule(_ molecule: Molecule) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view?.showMolecule(molecule)
        }
    }

    func reciveElementsInfo(_ elements: Elements) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view?.setElementsInfo(elements)
        }
    }
}
