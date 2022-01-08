//
//  ProteinListAssembly.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//  
//

import UIKit

enum ProteinListAssembly {
    // MARK: Static methods
    static func createModule() -> UIViewController {
        let router = ProteinListRouter()
        let interactor = ProteinListInteractor()
        let dataSource = ProteinListDataSource()
        let presenter = ProteinListPresenter(
            interactor: interactor,
            router: router,
            dataSource: dataSource
        )
        let view = ProteinListView(presenter: presenter)
        presenter.view = view
        router.view = view
        dataSource.presenter = presenter
		interactor.presenter = presenter
        return view
    }
}
