//
//  HomeViewController.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 03/07/2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Public properties -
    var presenter: HomePresenterProtocol?
    
    // MARK: - IBOutlets -
    
    // MARK: - Class properties -
    private let refreshControl = UIRefreshControl()
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        networkRequest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
}

// MARK: - Extensions -
extension HomeViewController {
    
    private func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshAndGetData), for: .valueChanged)
        refreshControl.tintColor = .darkGray
    }
    
    @objc private func refreshAndGetData() {
        removeEmptyView()
        presenter?.getData()
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func reloadView() {
    }
    
    func addEmptyView(_ state: EmptyViewState) {
        ErrorView.addEmptyView(in: self.view, state: state)
    }
    
    func showError(with message: String) {
        ErrorView.addEmptyView(in: self.view, state: .error, errorMessage: message)
    }
    
    func removeEmptyView() {
        ErrorView.removeEmptyView(from: self.view)
    }
}

extension HomeViewController: SetupViewController {
    
    func setupNavigation() {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setupView() {
        setupRefreshControl()
    }
    
    func networkRequest() {
        refreshAndGetData()
    }
}
