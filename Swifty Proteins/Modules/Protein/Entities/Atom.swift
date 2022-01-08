//
//  Atom.swift
//  Swifty Proteins
//
//  Created by Clothor- on 1/6/22.
//

import SceneKit

final class Atom: Equatable {
    /// ID
    let id: Int
    /// Atom ID
    let atomID: String
    /// Atom type
    let type: String
    /// Vector x.y.z
    let vector: SCNVector3
    /// Connects atom
    var connects: [Int]

    init(
        id: Int = 0,
        atomID: String = "",
        type: String = "",
        vector: SCNVector3 = .init(),
        connects: [Int] = []
    ) {
        self.id = id
        self.atomID = atomID
        self.type = type
        self.vector = vector
        self.connects = connects
    }

    static func == (lhs: Atom, rhs: Atom) -> Bool {
        lhs.id == rhs.id
    }
}
