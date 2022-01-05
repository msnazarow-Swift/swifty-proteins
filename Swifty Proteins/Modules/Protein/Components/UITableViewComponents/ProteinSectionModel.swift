// 
//  ProteinSectionModel.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import Foundation

final class ProteinSectionModel: TableViewSectionProtocol {
    var rows: [Identifiable] = []

    init(_ properties: [Any]) {
        properties.forEach {
            rows.append(ProteinCellModel($0))
        }
    }
}
