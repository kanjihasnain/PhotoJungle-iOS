//
//  UIStoryboard.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 01/07/2021.
//

import Foundation
import UIKit

extension UIStoryboard {

    func instantiateViewController<T: UIViewController>(ofType _: T.Type,
                                                        withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        guard let controller = instantiateViewController(withIdentifier: identifier) as? T else {
            assertionFailure("instantiateNavigationController controller unwrapped failed")
            fatalError()
        }
        return controller
    }
}
