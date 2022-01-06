//
//  Atom.swift
//  Swifty Proteins
//
//  Created by Clothor- on 1/6/22.
//

import SceneKit

final class Atom: Equatable {
    /// Atom ID
    let id: Int
    /// Atom type
    let type: String
    /// Vector x.y.z
    let vector: SCNVector3
    /// Connects atom
    var connects: [Int]
    
    init(
        id: Int = 0,
        type: String = "",
        vector: SCNVector3 = .init(),
        connects: [Int] = []
    ) {
        self.id = id
        self.type = type
        self.vector = vector
        self.connects = connects
    }
    
    static func == (lhs: Atom, rhs: Atom) -> Bool {
        lhs.id == rhs.id
    }
}
