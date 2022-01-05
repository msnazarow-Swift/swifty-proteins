//
//  AuthentificationContract.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

// MARK: View Output (Presenter -> View)
protocol PresenterToViewAuthentificationProtocol: AnyObject {
    func showAlert(message: String)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterAuthentificationProtocol: AnyObject {
    func viewDidLoad()
    func didButtonTapped()
}

// MARK: Presenter Output (Presenter -> Router)
protocol PresenterToRouterAuthentificationProtocol: AnyObject {
    func routeToMain()
}
