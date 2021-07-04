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
        return UITableViewCell()
        //        let cell = tableView.dequeueReusableCell(with: SingleTextFieldTableViewCell.self, for: indexPath)
        //        cell.cellType = forType
        //        cell.configureCell(object: self.presenter?.getFieldValue(forType))
        //        cell.delegate = self
        //        return cell
    }
}
