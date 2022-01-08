//
//  AuthentificationPresenter.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//  
//

import LocalAuthentication

class AuthentificationPresenter: ViewToPresenterAuthentificationProtocol {
    // MARK: Properties
    weak var view: PresenterToViewAuthentificationProtocol!
    let router: PresenterToRouterAuthentificationProtocol

    let context = LAContext()
    var compliton: (() -> Void)! {
        didSet {
            compliton()
        }
    }
    // MARK: Init
    init(
		view: PresenterToViewAuthentificationProtocol,
		router: PresenterToRouterAuthentificationProtocol
	) {
        self.view = view
        self.router = router
    }

    func viewDidLoad() {
    }

    func didButtonTapped() {
        auth()
    }

    private func auth() {
        let reason = NSLocalizedString("You should be authorized", comment: "reason for auth")
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
                if !success || error != nil {
                    print(error?.localizedDescription ?? "Error occured")
                } else {
                    self.router.routeToProteinList()
                }
            }
        }
    }
}
