// 
//  ProteinCell.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinCell: UITableViewCell, CellIdentifiable {
	weak var presenter: CellOutput?
	var model: ModelIdentifiable?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	func updateViews() {
        guard let model = model as? ProteinCellModel else { return }

    }
}
