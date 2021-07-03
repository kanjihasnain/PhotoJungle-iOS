//
//  HomeInteractor.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 03/07/2021.
//

import UIKit

final class HomeInteractor {
    
    weak var presenter: HomeInteractorOutputProtocol?
}

extension HomeInteractor: HomeInteractorInputProtocol {
    
    func getItemsFromServer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.presenter?.failedFetchingData()
        })
    }
}
