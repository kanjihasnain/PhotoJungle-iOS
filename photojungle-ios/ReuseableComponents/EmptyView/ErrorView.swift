//
//  EmptyView.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 01/07/2021.
//

import UIKit

// MARK: This View Help Us To Show The Message To The Users.
class ErrorView: UIView {
    
    // MARK: - IBOutlets -
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
}

extension ErrorView {
    
    class func addEmptyView(in view: UIView,
                            state: EmptyViewState,
                            errorMessage: String? = nil) {
        guard let emptyView = ErrorView.loadFromXib() as? ErrorView else { return }
        // MARK: Removing EmptyView if added before
        ErrorView.removeEmptyView(from: view)
        emptyView.tag = 1001
        // emptyView.backgroundColor = .white
        emptyView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        emptyView.viewImage.image = UIImage(named: state.image)
        emptyView.titleLabel.text = state.title
        emptyView.subTitleLabel.text = errorMessage ?? state.subTitle
        view.insertSubview(emptyView, at: 0)
    }
    
    class func removeEmptyView(from view: UIView) {
        view.subviews.forEach({
            $0.tag == 1001 ? $0.removeFromSuperview() : ()
        })
    }
}
