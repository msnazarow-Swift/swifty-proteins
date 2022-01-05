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
	var proteins: [String] = []

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
	func viewDidLoad() {
		guard
			let filepath = Bundle.main.path(forResource: "ligands", ofType: "txt"),
			let proteins = try? String(contentsOfFile: filepath).components(separatedBy: .newlines)
		else { return }
		self.proteins = proteins
		dataSource.updateForSections([ProteinListSection(proteins)])
	}

	func updateSearchResults(text: String?) {
		if  let text = text, !text.isEmpty {
			let filteredProteins = proteins.filter { $0.starts(with: text) }
			dataSource.updateForSections([ProteinListSection(filteredProteins)])
		} else {
			dataSource.updateForSections([ProteinListSection(proteins)])
		}
		view?.tableViewReload()
	}
}

// MARK: - Cell Output (Cell -> Presenter)
extension ProteinListPresenter: ProteinListCellOutput {}

// MARK: - Interactor Output (Interactor -> Presenter)
extension ProteinListPresenter: ProteinListInteractorOutput {}

extension ProteinListPresenter: ProteinListDataSourceOutput {
	func didSelectProtein(_ protein: ProteinListCellModel) {
		router.routeToProtein(protein.title)
	}
}
