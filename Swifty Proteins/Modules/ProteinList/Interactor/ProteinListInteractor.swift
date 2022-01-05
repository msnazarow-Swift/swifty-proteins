// 
//  ProteinListInteractor.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import Foundation

class ProteinListInteractor {
	weak var presenter: ProteinListInteractorOutput?
}

// MARK: - Interactor Input (Presenter -> Interactor)
extension ProteinListInteractor: ProteinListInteractorInput {}
