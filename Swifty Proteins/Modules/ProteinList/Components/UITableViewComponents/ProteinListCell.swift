// 
//  ProteinListCell.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinListCell: CellIdentifiable {
	let titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.contentMode = .center
		label.textColor = .white
		return label
	}()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupUI()
    }

	func setupUI() {
		selectionStyle = .none
		backgroundColor = .clear
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

    override func updateViews() {
        guard let model = model as? ProteinListCellModel else { return }
		titleLabel.text = model.title
    }
}
