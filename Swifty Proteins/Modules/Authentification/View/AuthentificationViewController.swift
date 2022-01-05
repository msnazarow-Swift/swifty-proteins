//
//  AuthentificationViewController.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import UIKit

class AuthentificationViewController: UIViewController {

    // MARK: - Properties
    var presenter: ViewToPresenterAuthentificationProtocol!

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Paper, Please!", for: .normal)
        button.setTitleColor(.cyan, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didButtonTapped), for: .touchUpInside)
        return button
    }()

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

    private func addSubviews() {
        view.addSubview(button)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func didButtonTapped(){
        presenter.didButtonTapped()
    }
}

extension AuthentificationViewController: PresenterToViewAuthentificationProtocol{
    func showAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
