// 
//  ProteinListDataSource.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinListDataSource: NSObject {
    // MARK: Properties
    weak var presenter: ProteinListCellOutput?
    private var sections: [TableViewSectionProtocol] = []
}

// MARK: - DataSource Input (Presenter -> DataSource)
extension ProteinListDataSource: ProteinListDataSourceInput {
	func updateForSections(_ sections: [TableViewSectionProtocol]) {
		self.sections = sections
	}

	func numberOfSections(in _: UITableView) -> Int {
		return sections.count
	}
}

// MARK: - UITableViewDataSource
extension ProteinListDataSource {
	func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections[section].rows.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = sections[indexPath.section].rows[indexPath.row]
		guard let cell = tableView.dequeueReusableCell(withIdentifier: model.identifier, for: indexPath) as? CellIdentifiable else {
			return UITableViewCell()
		}
		cell.presenter = presenter
		cell.model = model
		return cell
	}
}
