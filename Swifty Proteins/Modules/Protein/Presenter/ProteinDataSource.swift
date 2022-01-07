// 
//  ProteinDataSource.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinDataSource: NSObject {
    // MARK: Properties
    weak var presenter: ProteinCellOutput?
    private var sections: [SectionProtocol] = []
}

// MARK: - DataSource Input (Presenter -> DataSource)
extension ProteinDataSource: ProteinDataSourceInput {
	func updateForSections(_ sections: [SectionProtocol]) {
		self.sections = sections
	}

	func numberOfSections(in _: UITableView) -> Int {
		return sections.count
	}
}

// MARK: - UITableViewDataSource
extension ProteinDataSource {
	func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections[section].rows.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let model = sections[indexPath.section].rows[indexPath.row]
		guard let cell = tableView.dequeueReusableCell(withIdentifier: model.identifier, for: indexPath) as? (CellIdentifiable & UITableViewCell) else {
			return UITableViewCell()
		}
		cell.presenter = presenter
		cell.configure(with: model)
		return cell
	}
}
