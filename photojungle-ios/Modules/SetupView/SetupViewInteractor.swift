//
//  SetupViewInteractor.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 03/07/2021.
//

import UIKit

final class SetupViewInteractor {
    
    weak var presenter: SetupViewInteractorOutputProtocol?
}

extension SetupViewInteractor: SetupViewInteractorInputProtocol {
    
    // MARK: Just For Mimicking Ap An API Call Here.
    func getAppMeta() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            Bootstrapper.startAppAfterSetup()
        })
    }
}
