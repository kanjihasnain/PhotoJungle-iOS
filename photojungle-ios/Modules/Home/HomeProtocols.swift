//
//  HomeProtocols.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 03/07/2021.
//

import Foundation

// MARK: Wireframe -
protocol HomeWireframeProtocol: class {
    func openItemDetails(with ofItem: Items) 
}
// MARK: Presenter -
protocol HomePresenterProtocol: class {
    
    var interactor: HomeInteractorInputProtocol? { get set }
    
    func getData()
    func getCellDetails(at indexPath: IndexPath) -> ItemViewModel?
    func getRowCount() -> Int
    func didSelectItem(at indexPath: IndexPath)
}

// MARK: Interactor -
protocol HomeInteractorOutputProtocol: class {
    
    /* Interactor -> Presenter */
    func itemsFetchedSucessfully(_ itemsData: [Items])
    func failedFetchingData()
    func showError(with message: String)
}

protocol HomeInteractorInputProtocol: class {
    
    var presenter: HomeInteractorOutputProtocol? { get set }
    
    /* Presenter -> Interactor */
    func getItemsFromServer(pageNumber page: String)
}

// MARK: View -
protocol HomeViewProtocol: class {
    
    var presenter: HomePresenterProtocol? { get set }
    
    /* Presenter -> ViewController */
    func addEmptyView(_ state: EmptyViewState)
    func showError(with message: String)
    func removeEmptyView()
    func reloadView()
}
