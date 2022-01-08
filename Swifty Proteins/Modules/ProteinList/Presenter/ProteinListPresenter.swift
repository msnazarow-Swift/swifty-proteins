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
	func viewDidLoad(_ view: ProteinListViewInput) {
		guard
			let filepath = Bundle.main.path(forResource: "ligands", ofType: "txt"),
			let proteins = try? String(contentsOfFile: filepath).components(separatedBy: .newlines)
		else {
			DispatchQueue.main.async {
				view.showError("No ligands file found")
			}
			return
		}
		self.proteins = proteins.compactMap{ $0.isEmpty ? nil : $0 }

		dataSource.updateForSections(generateAlphaSorted(proteins: proteins).map { ProteinListSection($1) })
		dataSource.updateForHeaders(generateAlphaSorted(proteins: proteins).map { ProteinListHeaderModel(title: String($0.key)) })
		view.tableViewReload()
	}

	private func generateAlphaSorted(proteins: [String]) -> [Dictionary<Character, [String]>.Element] {
		var alphabet: [Character: [String]] = [:]
		for protein in proteins {
			guard let ch = protein.first else { continue }
			if alphabet[ch] == nil {
				alphabet[ch] = [protein]
			} else {
				alphabet[ch]?.append(protein)
			}
		}
		for (key, value) in alphabet {
			alphabet[key] = value.sorted()
		}
		return alphabet.sorted { item1, item2 in item1.key < item2.key }
	}

	func updateSearchResults(_ view: ProteinListViewInput, text: String?) {
		if  let text = text?.uppercased(), !text.isEmpty {
			let filteredProteins = proteins.filter { $0.starts(with: text) }
			dataSource.updateForSections(generateAlphaSorted(proteins: filteredProteins).map { ProteinListSection($1) })
			dataSource.updateForHeaders(generateAlphaSorted(proteins: filteredProteins).map { ProteinListHeaderModel(title: String($0.key)) })
		} else {
			dataSource.updateForSections(generateAlphaSorted(proteins: proteins).map { ProteinListSection($1) })
			dataSource.updateForHeaders(generateAlphaSorted(proteins: proteins).map { ProteinListHeaderModel(title: String($0.key)) })
		}
		view.tableViewReload()
	}

	func randomButtonTapped(_ view: ProteinListViewInput) {
		guard let protein = proteins.randomElement() else { return }
		router.routeToProtein(protein)
	}

	func customButtonTapped(_ view: ProteinListViewInput) {
		view.showCustomLigandTextField()
	}

	func okButtonTapped(_ view: ProteinListViewInput, text : String?) {
		guard let text = text?.uppercased(), !text.isEmpty else {
			view.showError("Empty field")
			return
		}
		router.routeToProtein(text)
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
