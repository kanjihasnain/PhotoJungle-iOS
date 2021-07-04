//
//  HomeTableViewCell.swift
//  photojungle-ios
//
//  Created by Kanji on 04/07/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!

    var viewModel: ItemViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            ImageManager.shared.setImage(with: viewModel.thumbnailsUrl, imageView: self.thumbnailImageView)
            layoutIfNeeded()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        thumbnailImageView.image = UIImage(named: "placeholder-image")
    }

    override func prepareForReuse() {
        thumbnailImageView.image = nil
        thumbnailImageView.image = UIImage(named: "placeholder-image")
        super.prepareForReuse()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        thumbnailImageView.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 8.0)
    }
}
