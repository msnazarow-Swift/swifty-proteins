// 
//  ProteinListCell.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinListCell: UICollectionViewCell, CellIdentifiable {
	weak var presenter: CellOutput?
	var model: ModelIdentifiable?

	let titleLabel: UILabel = {
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

	func setupUI() {
		backgroundColor = UIColor.tertiarySystemBackground.withAlphaComponent(0.7)
		layer.cornerRadius = 10
		clipsToBounds = true
		addSubviews()
		setupConstraints()
	}

	func addSubviews() {
		contentView.addSubview(titleLabel)
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5)
		])
	}


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	func updateViews() {
        guard let model = model as? ProteinListCellModel else { return }
		titleLabel.text = model.title
    }
}
