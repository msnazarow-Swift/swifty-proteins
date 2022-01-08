// 
//  ProteinInteractor.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import Foundation

class ProteinInteractor {
	weak var presenter: ProteinInteractorOutput?
    private let parser: ParserInput

    init(parser: ParserInput = ParserPDB.shared) {
        self.parser = parser
    }
}

enum ProteinInteractorError: LocalizedError {
	case nodata
	case httpError(Int)
	case dataNotValid

	public var errorDescription: String? {
		switch self {
		case .nodata:
			return "No data"
		case .dataNotValid:
			return "Data is not valid for parsing"
		case let .httpError(code):
			return "Http Error \(code) code"
		}
	}
}

// MARK: - Interactor Input (Presenter -> Interactor)
extension ProteinInteractor: ProteinInteractorInput {
    func getMolecule(name: String) {
        guard let urlLigands = URL(string: "http://files.rcsb.org/ligands/view/\(name)_ideal.pdb")
        else {
            self.presenter?.reciveError(ProteinInteractorError.dataNotValid)
            return
        }
        URLSession.shared.dataTask(with: urlLigands) { [weak self] data, response, error in
			guard let self = self else { return }
			if let error = error {
				self.presenter?.reciveError(error)
				return
			}
			guard let data = data, let response = response as? HTTPURLResponse else {
				self.presenter?.reciveError(ProteinInteractorError.nodata)
				return
			}
			if !Array(200..<300).contains(response.statusCode) {
				self.presenter?.reciveError(ProteinInteractorError.httpError(response.statusCode))
				return
			}
			if let fileText = String(data: data, encoding: .utf8), !fileText.isEmpty {
                let molecule = self.parser.parsePDB(fileText)
                self.presenter?.presentMolecule(molecule)
            } else {
				self.presenter?.reciveError(ProteinInteractorError.dataNotValid)
            }
        }
		.resume()
    }

    func getElementsInfo() {
        if
			let path = Bundle.main.path(forResource: "PeriodicTableJSON", ofType: "json"),
			let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
            do {
                let elements = try JSONDecoder().decode(Elements.self, from: data)
                self.presenter?.reciveElementsInfo(elements)
            } catch {
                self.presenter?.reciveError(ProteinInteractorError.dataNotValid)
            }
        }
    }
}
