//
//  Element.swift
//  Swifty Proteins
//
//  Created by Clothor- on 1/8/22.
//

import Foundation

struct Elements: Equatable, Decodable {
    let elements: [Element]

    init(elements: [Element] = []) {
        self.elements = elements
    }
}

struct Element: Equatable, Decodable {
	let symbol: String
	let name: String
	let category: String
	let appearance: String?
	let atomicMass: Double
	let energyLevels: [Int]
	let meltingPoint: Double?
	let boilingPoint: Double?
	let phase: String
	let density: Double?

	enum CodingKeys: String, CodingKey {
		case symbol
		case name
		case appearance
		case category
		case atomicMass = "atomic_mass"
		case energyLevels = "shells"
		case meltingPoint = "melt"
		case boilingPoint = "boil"
		case phase
		case density
	}
}
