//
//  SetupViewRouter.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 03/07/2021.
//


import UIKit

final class SetupViewRouter {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {

        let storyboard = getStoryBoard(.main)
        let view = storyboard.instantiateViewController(ofType: SetupViewViewController.self)
        
        let interactor = SetupViewInteractor()
        let router = SetupViewRouter()
        let presenter = SetupViewPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}

extension SetupViewRouter: SetupViewWireframeProtocol {

}
