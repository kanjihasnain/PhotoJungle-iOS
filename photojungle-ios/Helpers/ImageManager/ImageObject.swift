//
//  ImageObject.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 04/07/2021.
//

import Foundation
import UIKit

// MARK: The NSObject Helping Us Here To Store Images. There Is Case When NSCache Looses Data when app is in background so this class prevents that.
class ImageObject: NSObject, NSDiscardableContent {
    
    var image: UIImage!
    
    func beginContentAccess() -> Bool {
        return true
    }
    
    func endContentAccess() {
        
    }
    
    func discardContentIfPossible() {
        
    }
    
    func isContentDiscarded() -> Bool {
        return false
    }
}
