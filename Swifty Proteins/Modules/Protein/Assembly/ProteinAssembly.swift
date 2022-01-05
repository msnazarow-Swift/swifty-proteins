//
//  ProteinAssembly.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//  
//

import UIKit

enum ProteinAssembly{
    // MARK: Static methods
	static func createModule(protein: String) -> UIViewController {
        let router = ProteinRouter()
        let interactor = ProteinInteractor()
        let dataSource = ProteinDataSource()
        let presenter = ProteinPresenter(
            interactor: interactor,
            router: router,
            dataSource: dataSource,
			protein: protein
        )
        let view = ProteinView(presenter: presenter)
        presenter.view = view
        router.view = view
        dataSource.presenter = presenter
		interactor.presenter = presenter
        return view
    }
}
