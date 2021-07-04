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
}
