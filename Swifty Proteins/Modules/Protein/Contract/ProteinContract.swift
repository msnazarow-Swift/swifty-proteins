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
}

// MARK: - View Output (View -> Presenter)
protocol ProteinViewOutput: AnyObject {
    var dataSource: ProteinDataSourceInput { get }
    func viewDidLoad()
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol ProteinInteractorInput: AnyObject {
    func getMolecule(name: String)
}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol ProteinInteractorOutput: AnyObject {
    func presentMolecule(_: Molecule)
}

// MARK: - Router Input (Presenter -> Router)
protocol ProteinRouterInput: AnyObject {}

// MARK: - DataSource Input (Presenter -> DataSource)
protocol ProteinDataSourceInput: UITableViewDataSource {
    func updateForSections(_ sections: [TableViewSectionProtocol])
}

// MARK: - Cell Output (Cell -> Presenter)
protocol ProteinCellOutput: AnyObject {}
