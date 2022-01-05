// 
//  ProteinListContract.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import UIKit

// MARK: - View Input (Presenter -> View)
protocol ProteinListViewInput: AnyObject {}

// MARK: - View Output (View -> Presenter)
protocol ProteinListViewOutput: AnyObject {
    var dataSource: ProteinListDataSourceInput { get }
    func viewDidLoad()
}

// MARK: - Interactor Input (Presenter -> Interactor)
protocol ProteinListInteractorInput: AnyObject {}

// MARK: - Interactor Output (Interactor -> Presenter)
protocol ProteinListInteractorOutput: AnyObject {}

// MARK: - Router Input (Presenter -> Router)
protocol ProteinListRouterInput: AnyObject {}

// MARK: - DataSource Input (Presenter -> DataSource)
protocol ProteinListDataSourceInput: UITableViewDataSource {
    func updateForSections(_ sections: [TableViewSectionProtocol])
}

// MARK: - Cell Output (Cell -> Presenter)
protocol ProteinListCellOutput: AnyObject {}
