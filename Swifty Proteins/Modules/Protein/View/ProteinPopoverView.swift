//
//  PopViewController.swift
//  Swifty Proteins
//
//  Created by Clothor- on 1/7/22.
//

import UIKit

final class ProteinPopoverView: UIViewController {
    private let gap: CGFloat = 10
    private let regularFontName = "Helvetica"
    private let boldFontName = "Helvetica-Bold"

    private lazy var symbolLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: boldFontName, size: 17.0)
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont(name: boldFontName, size: 17.0)
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
        view.addSubview(symbolLabel)
        view.addSubview(nameLabel)
        view.addSubview(stackView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            symbolLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: gap),
            symbolLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: gap),
            symbolLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -gap),

            nameLabel.topAnchor.constraint(equalTo: symbolLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: gap),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -gap),

            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: gap),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: gap),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -gap),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -gap)
        ])
    }
}

extension ProteinPopoverView {
    func configure(element: Element) {
        let energyLevels = element.energyLevels.map { String($0) }.joined(separator: ", ")
        symbolLabel.text = element.symbol
        nameLabel.text = element.name
        addInfo(info: "Chemical series: ", value: element.category)
        addInfo(info: "Appearance: ", value: element.appearance)
        addInfo(info: "Weight: ", value: element.atomicMass.description, unit: "u")
        addInfo(info: "Energy levels: ", value: energyLevels)
        addInfo(info: "Melting point: ", value: element.meltingPoint?.description, unit: "K")
        addInfo(info: "Boiling point: ", value: element.boilingPoint?.description, unit: "K")
        addInfo(info: "Phase: ", value: element.phase)
        addInfo(info: "Density: ", value: element.density?.description, unit: "g/cm3")
    }

    private func addInfo(info: String, value: String?, unit: String = "") {
        guard let text = value else { return }
        let label = UILabel()
        label.font = UIFont(name: regularFontName, size: 13.0)
        label.numberOfLines = 2
        let myString = info.appending(text).appending(" \(unit)")
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: boldFontName, size: 13.0) ?? UIFont() ]
        let attributedString = NSMutableAttributedString(string: myString)
        attributedString.addAttributes(myAttribute, range: NSRange(location: 0, length: info.count))
        if
			let lastCharacter = myString.last,
			lastCharacter.isNumber,
			let font = UIFont(name: regularFontName, size: 9.0) {
			attributedString.addAttributes(
                [
                    NSAttributedString.Key.font: font,
                    NSAttributedString.Key.baselineOffset: 4
                ],
                range: NSRange.init(location: myString.count - 1, length: 1)
            )
        }

        label.attributedText = attributedString
        stackView.addArrangedSubview(label)
    }
}
