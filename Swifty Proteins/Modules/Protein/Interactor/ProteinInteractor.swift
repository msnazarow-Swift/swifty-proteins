// 
//  ProteinInteractor.swift
//  Swifty Proteins
//
//  Created by 19733654 on 05.01.2022.
//

import Foundation

class ProteinInteractor {
	weak var presenter: ProteinInteractorOutput?
}

// MARK: - Interactor Input (Presenter -> Interactor)
extension ProteinInteractor: ProteinInteractorInput {}
