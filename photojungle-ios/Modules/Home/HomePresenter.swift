//
//  HomePresenter.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 03/07/2021.
//

import UIKit

struct ItemViewModel {
    var thumbnailsUrl: String
}

final class HomePresenter {
    
    weak private var view: HomeViewProtocol!
    var interactor: HomeInteractorInputProtocol!
    private let router: HomeWireframeProtocol
    
    private var itemsData = [Items]()
    private var pageNumber = 1
    private var isFetchingContent = false

    
    init(interface: HomeViewProtocol,
         interactor: HomeInteractorInputProtocol,
         router: HomeWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }
}

extension HomePresenter: HomePresenterProtocol {
    
    func getData() {
        // MARK: isFetchingContent Help To Stop If user tries to use pull to refresh twice
        guard !isFetchingContent else { return }
        isFetchingContent = true
        interactor?.getItemsFromServer(pageNumber: "\(pageNumber)")
    }

    func getNextPageData() {
        guard !isFetchingContent, pageNumber > 1,
              !itemsData.isEmpty else {
            return
        }
        isFetchingContent = true
        interactor?.getItemsFromServer(pageNumber: "\(pageNumber)")
    }
    
    func getCellDetails(at indexPath: IndexPath) -> ItemViewModel? {
        // MARK: Using safe subscripts to avoid any crash
        return itemsData[safe: indexPath.row]?.getViewModel()
    }
    
    // MARK: return the counts of data source
    func getRowCount() -> Int {
        return self.itemsData.count
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        guard let item = itemsData[safe: indexPath.row] else {
            return
        }
        router.openItemDetails(with: item)
    }
}

extension HomePresenter: HomeInteractorOutputProtocol {
    
    // MARK: After Items are fetch, view is refresh and error view is removed in case shown
    func itemsFetchedSucessfully(_ itemsData: [Items]) {
        self.itemsData.append(contentsOf: itemsData)
        self.isFetchingContent = false
        !itemsData.isEmpty ? (self.pageNumber += 1) : ()
        DispatchQueue.main.async {
            // MARK: In case data items are empty error is shown on screen
            !itemsData.isEmpty ? self.view?.removeErrorView() : self.view?.showError(with: "No Data Found")
            self.view?.reloadView()
        }
    }
    
    func showError(with message: String) {
        DispatchQueue.main.async {
            self.view?.reloadView()
            self.view?.showError(with: message)
            self.isFetchingContent = false
        }
    }
    
    func failedFetchingData() {
        DispatchQueue.main.async {
            self.view?.reloadView()
            // MARK: Before showing a generic message, checking if error is caused by network loss
            if self.itemsData.isEmpty {
                !isInternetAvailable() ? self.view?.addErrorView(state: .noInternet) : self.view?.addErrorView(state: .somethingWrong)
            }
            self.isFetchingContent = false
        }
    }
}
