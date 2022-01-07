// 
//  ScreenShotInteractor.swift
//  Swifty Proteins
//
//  Created by 19733654 on 07.01.2022.
//

import Foundation

class ScreenShotInteractor {
	weak var presenter: ScreenShotInteractorOutput?
}

// MARK: - Interactor Input (Presenter -> Interactor)
extension ScreenShotInteractor: ScreenShotInteractorInput {}
