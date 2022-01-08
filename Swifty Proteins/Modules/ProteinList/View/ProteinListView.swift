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
	var footerConstraint: NSLayoutConstraint?

	// MARK: - Views
	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
		collectionView.register(ProteinListCell.self)
		collectionView.register(ProteinListHeader.self)
		collectionView.dataSource = presenter.dataSource
		collectionView.delegate = presenter.dataSource
		collectionView.backgroundColor = .clear
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.showsVerticalScrollIndicator = false
		return collectionView
	}()

	lazy var searchController: UISearchController = {
		let sc = UISearchController(searchResultsController: nil)
		sc.searchResultsUpdater = self
		sc.obscuresBackgroundDuringPresentation = false
		sc.searchBar.placeholder = "Search proteins"
		return sc
	}()

    // MARK: - Init
    convenience init(presenter: ProteinListViewOutput) {
        self.init()
        self.presenter = presenter
    }

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
		subscribeKeyboardNotifications()
        presenter.viewDidLoad(self)
    }

    private func setupUI() {
		title = "Proteins"
		view.backgroundColor = UIColor(patternImage: UIImage(named: "patternImage")!)
		setupNavigationItem()
        addSubviews()
        setupConstraints()
    }

	private func setupNavigationItem() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationItem.hidesSearchBarWhenScrolling = false
		navigationItem.searchController = searchController
		navigationItem.titleView?.tintColor = .white
		let randomButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(randomButtonTapped))
		let customButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(customButtonTapped))
		navigationItem.setRightBarButton(randomButton, animated: true)
		navigationItem.setRightBarButtonItems([customButton, randomButton], animated: true)
		definesPresentationContext = false
	}

    private func addSubviews() {
		view.addSubview(collectionView)
	}

    private func setupConstraints() {
		NSLayoutConstraint.activate([
			collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
		])
		footerConstraint = collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		footerConstraint?.isActive = true
	}

	@objc func randomButtonTapped() {
		presenter.randomButtonTapped(self)
	}

	@objc func customButtonTapped() {
		presenter.customButtonTapped(self)
	}
}

// MARK: - View Input (Presenter -> View)
extension ProteinListView: ProteinListViewInput {
	func tableViewReload() {
		DispatchQueue.main.async {
			self.collectionView.reloadData()
		}
	}

	func showError(_ message: String) {
		let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default))
		present(alert, animated: true)
	}

	func showCustomLigandTextField() {
		let alert = UIAlertController(title: "Curstom ligand", message: "Enter from one to three letters", preferredStyle: .alert)
		alert.addTextField()
		let action = UIAlertAction(title: "OK", style: .default) { _ in
			self.presenter.okButtonTapped(self, text: alert.textFields?[0].text)
		}
		alert.addAction(action)
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
		present(alert, animated: true)

	}
}

extension ProteinListView: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		presenter.updateSearchResults(self, text: searchController.searchBar.text)
	}
}

// MARK: - KeyboardNotifications
private extension ProteinListView {
	private func subscribeKeyboardNotifications() {
		let notificationCenter = NotificationCenter.default
		notificationCenter.addObserver(
			self,
			selector: #selector(keyboardWillHide),
			name: UIResponder.keyboardWillHideNotification,
			object: nil
		)
		notificationCenter.addObserver(
			self,
			selector: #selector(keyboardWillShow),
			name: UIResponder.keyboardWillShowNotification,
			object: nil
		)
	}

	@objc private func keyboardWillShow(_ notification: Notification) {
		if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
			footerConstraint?.constant = -keyboardSize.height + view.safeAreaInsets.bottom
		}
	}

	@objc private func keyboardWillHide(_ notification: Notification) {
		footerConstraint?.constant = 0
	}
}
