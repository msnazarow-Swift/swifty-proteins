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
	lazy var tableView: UITableView = {
		let tableView = UITableView()
		tableView.register(ProteinListCell.self)
		tableView.dataSource = presenter.dataSource
		tableView.delegate = presenter.dataSource
		tableView.backgroundColor = .clear
		tableView.translatesAutoresizingMaskIntoConstraints = false
		return tableView
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
		navigationItem.searchController = searchController
		navigationItem.titleView?.tintColor = .white
		definesPresentationContext = false
	}

    private func addSubviews() {
		view.addSubview(tableView)
	}

    private func setupConstraints() {
		NSLayoutConstraint.activate([
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
}

// MARK: - View Input (Presenter -> View)
extension ProteinListView: ProteinListViewInput {
	func tableViewReload() {
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}

extension ProteinListView: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		presenter.updateSearchResults(text: searchController.searchBar.text)
	}
}
