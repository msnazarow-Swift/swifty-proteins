//
//  MoleculeBuilder.swift
//  Swifty Proteins
//
//  Created by Clothor- on 1/6/22.
//

import SceneKit

protocol ParserInput {
    func parsePDB(_ text: String) -> Molecule
}

final class ParserPDB: ParserInput {
    /// Shared Parser
    static let shared: ParserInput = ParserPDB()
    
    private init() {}
    
    /// Returns filled molecule
    /// - Parameter text: Protein name
    /// - Returns: Molecule
    func parsePDB(_ text: String) -> Molecule {
        let molecule = Molecule()
        let separatedText = text.components(separatedBy: .newlines)
        molecule.name = separatedText.first?
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }[3] ?? ""
        for line in separatedText {
            if line.contains("ATOM") {
                let atom = getAtom(text: line)
                molecule.atoms.append(atom)
            }
            if line.contains("CONECT") {
                addConnects(text: line, molecule: molecule)
            }
            if line.contains("END") {
                break
            }
        }
        return molecule
    }
    
    // MARK: - Private
    
    private func getAtom(text: String) -> Atom {
        let atomComponents = text
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
        if atomComponents.count != 12 { return .init() }
        let id = Int(atomComponents[1]) ?? 0
        let atomID = atomComponents[2]
        let vector = SCNVector3(
            (Double(atomComponents[6]) ?? 0) / 100,
            (Double(atomComponents[7]) ?? 0) / 100,
            (Double(atomComponents[8]) ?? 0) / 100
        )
        let type = atomComponents[11]
        
        let atomModel = Atom(
            id: id,
            atomID: atomID,
            type: type,
            vector: vector,
            connects: []
        )
        
        return atomModel
    }

    private func addConnects(text: String, molecule: Molecule) {
        let connectComponents = text
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .dropFirst()
            .compactMap { Int($0) }
        guard connectComponents.count >= 2,
              let firstAtomID = connectComponents.first,
              let atom = molecule.atoms.first(where: { $0.id == firstAtomID })
        else { return }
        for connect in connectComponents {
            if connect > atom.id {
                atom.connects.append(connect)
            }
        }
    }
}
