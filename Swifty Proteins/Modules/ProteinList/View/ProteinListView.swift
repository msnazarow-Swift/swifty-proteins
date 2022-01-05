// 
//  ProteinListView.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

class ProteinListView: UIViewController {

    // MARK: - Properties
    var presenter: ProteinListViewOutput!

    // MARK: - Init
    convenience init(presenter: ProteinListViewOutput) {
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
extension ProteinListView: ProteinListViewInput {
    
}
