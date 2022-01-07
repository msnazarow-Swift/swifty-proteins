// 
//  ProteinContract.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

// MARK: - View Input (Presenter -> View)
protocol ProteinViewInput: AnyObject {
    func showMolecule(_: Molecule)
    func showError(_ error: String)
	func showMessage(title: String, text: String)
	func setTitle(_ title: String)
}

// MARK: - View Output (View -> Presenter)
protocol ProteinViewOutput: AnyObject {
    func viewDidLoad(_ view: ProteinViewInput)
	func shareButtonTapped(_ view: ProteinViewInput, image: UIImage)
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol ProteinInteractorInput: AnyObject {
    func getMolecule(name: String)
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol ProteinInteractorOutput: AnyObject {
    func presentMolecule(_: Molecule)
    func reciveError(_ error: Error)
}

// MARK: - Router Input (Presenter -> Router)
protocol ProteinRouterInput: AnyObject {
	func routeToScreenShot(image: UIImage)
}

// MARK: - DataSource Input (Presenter -> DataSource)
protocol ProteinDataSourceInput: UITableViewDataSource {
    func updateForSections(_ sections: [SectionProtocol])
}

// MARK: - Cell Output (Cell -> Presenter)
protocol ProteinCellOutput: CellOutput {}
