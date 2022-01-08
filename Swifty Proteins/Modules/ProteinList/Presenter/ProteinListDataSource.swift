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
	private var headers: [ProteinListHeaderModel] = []
	let gap: CGFloat = 10
}

// MARK: - DataSource Input (Presenter -> DataSource)
extension ProteinListDataSource: ProteinListDataSourceInput {
	func updateForSections(_ sections: [SectionProtocol]) {
		self.sections = sections
	}

	func updateForHeaders(_ headers: [ProteinListHeaderModel]) {
		self.headers = headers
	}
}

// MARK: - UICollectionViewDataSource
extension ProteinListDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		sections.count
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return sections[section].rows.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let model = sections[indexPath.section].rows[indexPath.row]
		guard let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: model.identifier,
			for: indexPath
		) as? (UICollectionViewCell & CellIdentifiable) else {
			return UICollectionViewCell()
		}
		cell.presenter = presenter
		cell.configure(with: model)
		return cell
	}
}

// MARK: - UITableViewDelegate
extension ProteinListDataSource {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		let indexPath = IndexPath(row: 0, section: section)
		let headerView = self.collectionView(
			collectionView,
			viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader,
			at: indexPath
		)
		return headerView.systemLayoutSizeFitting(
			CGSize(width: collectionView.frame.width, height: UIView.layoutFittingExpandedSize.height),
			withHorizontalFittingPriority: .required,
			verticalFittingPriority: .fittingSizeLevel
		)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		UIEdgeInsets(top: gap, left: gap, bottom: gap, right: gap)
	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let model = headers[indexPath.section]
		guard let cell = collectionView.dequeueReusableSupplementaryView(
			ofKind: kind,
			withReuseIdentifier: model.identifier,
			for: indexPath
		) as? (UICollectionReusableView & CellIdentifiable) else {
			return UICollectionReusableView()
		}
		cell.presenter = presenter
		cell.configure(with: model)
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let model = sections[indexPath.section].rows[indexPath.row] as? ProteinListCellModel else { return }
		presenter?.didSelectProtein(model)
	}
}
