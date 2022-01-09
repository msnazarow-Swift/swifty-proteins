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

	// MARK: - Views
	let backgroundImage: UIImageView = {
		let image = UIImageView(image: UIImage(named: "background"))
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		return image
	}()

	let button: UIButton = {
		let button = UIButton()
		button.setTitle("  Login  ", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = .darkGray
		button.translatesAutoresizingMaskIntoConstraints = false
		button.layer.cornerRadius = 10
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
		view.backgroundColor = UIColor.sceneBackground
        addSubviews()
        setupConstraints()
    }

    private func addSubviews() {
		view.addSubview(backgroundImage)
        view.addSubview(button)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
			backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),

			button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }

    @objc private func didButtonTapped() {
        presenter.didButtonTapped()
    }
}

extension AuthentificationViewController: PresenterToViewAuthentificationProtocol {
    func showAlert(message: String) {
        DispatchQueue.main.async {[weak self] in
			let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self?.present(alert, animated: true, completion: nil)
        }
    }
}
