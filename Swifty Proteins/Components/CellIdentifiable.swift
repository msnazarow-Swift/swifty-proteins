// 
//  CellIdentifiable.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

protocol CellOutput: AnyObject {}

protocol CellIdentifiable: ModelRepresentable, AnyObject {
	var presenter: CellOutput? { get set }
	var model: ModelIdentifiable? { get set }

	func configure(with model: ModelIdentifiable)
    func updateViews()
}

extension CellIdentifiable {
	func configure(with model: ModelIdentifiable) {
		self.model = model
		updateViews()
	}
}
