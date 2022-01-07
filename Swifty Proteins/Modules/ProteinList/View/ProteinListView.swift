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
        presenter.viewDidLoad()
    }

    private func setupUI() {
		view.backgroundColor = UIColor(patternImage: UIImage(named: "patternImage")!)
		setupSearchBar()
        addSubviews()
        setupConstraints()
    }

	private func setupSearchBar() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationItem.hidesSearchBarWhenScrolling = false
		navigationItem.searchController = searchController
		navigationItem.titleView?.tintColor = .white
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
}

// MARK: - View Input (Presenter -> View)
extension ProteinListView: ProteinListViewInput {
	func tableViewReload() {
		DispatchQueue.main.async {
			self.collectionView.reloadData()
		}
	}
}

extension ProteinListView: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		presenter.updateSearchResults(text: searchController.searchBar.text)
	}
}
