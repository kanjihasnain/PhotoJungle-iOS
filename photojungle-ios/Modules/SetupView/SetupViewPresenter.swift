//
//  SetupViewPresenter.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 03/07/2021.
//

import UIKit

final class SetupViewPresenter {

    weak private var view: SetupViewViewProtocol?
    var interactor: SetupViewInteractorInputProtocol?
    private let router: SetupViewWireframeProtocol
    
    init(interface: SetupViewViewProtocol,
         interactor: SetupViewInteractorInputProtocol?,
         router: SetupViewWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        interactor?.getAppMeta()
    }
}

extension SetupViewPresenter: SetupViewPresenterProtocol {

}

extension SetupViewPresenter: SetupViewInteractorOutputProtocol {

}
