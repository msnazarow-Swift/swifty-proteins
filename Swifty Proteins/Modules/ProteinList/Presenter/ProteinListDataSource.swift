// 
//  ProteinListDataSource.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinListDataSource: NSObject {
    // MARK: Properties
    weak var presenter: (ProteinListCellOutput & ProteinListDataSourceOutput)?
    private var sections: [SectionProtocol] = []
	private var headers: [String] = []
}

// MARK: - DataSource Input (Presenter -> DataSource)
extension ProteinListDataSource: ProteinListDataSourceInput {
	func updateForSections(_ sections: [SectionProtocol]) {
		self.sections = sections
	}

	func numberOfSections(in _: UITableView) -> Int {
		return sections.count
	}
}

// MARK: - UITableViewDataSource
extension ProteinListDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		sections.count
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return sections[section].rows.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let model = sections[indexPath.section].rows[indexPath.row]
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: model.identifier, for: indexPath) as? (UICollectionViewCell & CellIdentifiable) else {
			return UICollectionViewCell()
		}
		cell.presenter = presenter
		cell.configure(with: model)
		return cell
	}

}

// MARK: - UITableViewDelegate
extension ProteinListDataSource {
//	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//
//	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let model = sections[indexPath.section].rows[indexPath.row] as? ProteinListCellModel else { return }
		presenter?.didSelectProtein(model)
	}
}
