//
//  SetupViewViewController.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 03/07/2021.
//


import UIKit

final class SetupViewViewController: UIViewController, SetupViewViewProtocol {

	var presenter: SetupViewPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}
