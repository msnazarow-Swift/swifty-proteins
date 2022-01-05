// 
//  ProteinView.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinView: UIViewController {

    // MARK: - Properties
    var presenter: ProteinViewOutput!

    // MARK: - Init
    convenience init(presenter: ProteinViewOutput) {
        self.init()
        self.presenter = presenter
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }

    private func setupUI() {
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {}

    private func setupConstraints() {}
}

// MARK: - View Input (Presenter -> View)
extension ProteinView: ProteinViewInput {
    
}
