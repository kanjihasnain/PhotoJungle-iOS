//
//  SetupViewController.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 01/07/2021.
//

import Foundation

// MARK: A Set Of Protocols To Guide How ViewController And View Should Be Maintained.
protocol SetupViewController {
    func setupNavigation()
    func setupView()
    func networkRequest()
}

protocol SetupCell {
    func configureCell<T>(object: T)
}

protocol SetupHeader {
    func configuereHeader<T>(object: T, title: String?)
    func setupView()
}
