//
//  Molecule.swift
//  Swifty Proteins
//
//  Created by Clothor- on 1/6/22.
//

final class Molecule: Equatable {
    /// Molecule name
    var name: String
    /// Atoms
    var atoms: [Atom]

    init(
        name: String = "",
        atoms: [Atom] = []
    ) {
        self.name = name
        self.atoms = atoms
    }

    static func == (lhs: Molecule, rhs: Molecule) -> Bool {
        lhs.name == rhs.name && lhs.atoms == rhs.atoms
    }
}
