// 
//  ProteinListCellModel.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

struct ProteinListCellModel: Identifiable {
	let identifier = "ProteinListCell"
	let title: String

	init(_ property: String) {
		title = property
	}
}