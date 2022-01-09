//
//  ProteinListHeader.swift
//  Swifty Proteins
//
//  Created by 19733654 on 07.01.2022.
//

import UIKit

class ProteinListHeader: UICollectionReusableView, CellIdentifiable {
	var presenter: CellOutput?
	var model: ModelIdentifiable?
	let gap: CGFloat = 10
	let label: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.contentMode = .center
		return label
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupUI() {
		backgroundColor = UIColor.tertiarySystemBackground.withAlphaComponent(0.7)
		addSubviews()
		setupConstraints()
	}

	func addSubviews() {
		addSubview(label)
	}
	func setupConstraints() {
		let constraints = [
			label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -gap),
			label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: gap),
			label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -gap),
			label.topAnchor.constraint(equalTo: topAnchor, constant: gap)
		]

		constraints.forEach { $0.priority = UILayoutPriority(rawValue: 999) }
		NSLayoutConstraint.activate(constraints)
	}
	func updateViews() {
		guard let model = model as? ProteinListHeaderModel else { return }
		label.text = model.title
	}
}
