//
//  UICollectionView+Ext.swift
//  Swifty Proteins
//
//  Created by 19733654 on 07.01.2022.
//

import UIKit

extension UICollectionView {
	func register(_ cellClass: UICollectionViewCell.Type) {
		register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass.self))
	}

	func register(_ headerClass: UICollectionReusableView.Type) {
		register(
			headerClass,
			forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
			withReuseIdentifier: String(describing: headerClass.self)
		)
	}
}
