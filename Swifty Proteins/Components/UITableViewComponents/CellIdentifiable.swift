// 
//  CellIdentifiable.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class CellIdentifiable: UITableViewCell, ModelRepresentable {
    weak var presenter: AnyObject?

    var model: Identifiable? {
        didSet {
            updateViews()
        }
    }

    func updateViews() {}
}
