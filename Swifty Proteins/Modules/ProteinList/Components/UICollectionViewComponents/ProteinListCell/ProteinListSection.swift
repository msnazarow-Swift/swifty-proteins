// 
//  ProteinListSection.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import Foundation

final class ProteinListSection: SectionProtocol {
    var rows: [ModelIdentifiable] = []

    init(_ properties: [String]) {
        properties.forEach {
            rows.append(ProteinListCellModel($0))
        }
    }
}
