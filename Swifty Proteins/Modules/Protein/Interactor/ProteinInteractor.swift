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

// MARK: - Interactor Input (Presenter -> Interactor)
extension ProteinInteractor: ProteinInteractorInput {
    func getMolecule(name: String) {
        let urlLigands = URL(string: "http://files.rcsb.org/ligands/view/\(name)_ideal.pdb")!
        URLSession.shared.dataTask(with: urlLigands) { [weak self] data, response, error in
            if data != nil {
                guard let self = self,
                      let data = data,
                      let fileText = String(data: data, encoding: .utf8)
                else { return }
                let molecule = self.parser.parsePDB(fileText)
                self.presenter?.presentMolecule(molecule)
            } else {
                guard let self = self,
                      let error = error
                else { return }
                self.presenter?.reciveError(error)
            }
        }.resume()
    }
}
