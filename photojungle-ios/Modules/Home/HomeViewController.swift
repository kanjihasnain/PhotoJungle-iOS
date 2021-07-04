//
//  HomeViewController.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 03/07/2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Public properties -
    var presenter: HomePresenterProtocol!
    
    // MARK: - IBOutlets -
    @IBOutlet weak var tableView: UITableView!

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
        tableView.alwaysBounceVertical = true
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refreshAndGetData() {
        removeErrorView()
        presenter?.getData()
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func reloadView() {
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    func addErrorView(state: EmptyViewState) {
        ErrorView.addEmptyView(in: self.view, state: state)
    }
    
    func showError(with message: String) {
        ErrorView.addEmptyView(in: self.view, state: .error, errorMessage: message)
    }
    
    func removeErrorView() {
        ErrorView.removeView(from: self.view)
    }
}

extension HomeViewController: SetupViewController {
    
    func setupNavigation() {
        //.navigationController?.navigationBar.isHidden = true
        title = "Photo Feed"
    }
    
    func setupView() {

        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView()
        //tableView.register(cellType: HomeCollectionViewCell.self)

        setupRefreshControl()
    }
    
    func networkRequest() {
        refreshAndGetData()
    }
}
