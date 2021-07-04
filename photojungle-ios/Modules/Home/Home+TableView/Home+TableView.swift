//
//  Home+TableViewe.swift
//  photojungle-ios
//
//  Created by Kanji on 04/07/2021.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate { }

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getRowCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: HomeTableViewCell.self, for: indexPath)
        cell.viewModel = presenter.getCellDetails(at: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 275
    }

    func tableView(_ tableView: UITableView,
                   willDisplay cell: UITableViewCell,
                   forRowAt indexPath: IndexPath) {

        let lastSectionIndex: Int = self.tableView.numberOfSections - 1
        let lastRowIndex: Int = self.tableView.numberOfRows(inSection: lastSectionIndex) - 3
        if indexPath.row == lastRowIndex {
            presenter.getNextPageData()
        }
    }
}
