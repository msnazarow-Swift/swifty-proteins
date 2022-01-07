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
		randomButton.title = "Random"
		navigationItem.setRightBarButton(randomButton, animated: true)
		definesPresentationContext = false
	}

    private func addSubviews() {
		view.addSubview(collectionView)
	}

    private func setupConstraints() {
		NSLayoutConstraint.activate([
			collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}

	@objc func randomButtonTapped() {
		presenter.randomButtonTapped(self)
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
}

extension ProteinListView: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		presenter.updateSearchResults(self, text: searchController.searchBar.text)
	}
}
