//
//  Results.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 01/07/2021.
//

import Foundation

public struct Results<T> {
    
    public let successResponse: T?
    public let failureResponse: Error?

    init(success: T) {
        successResponse = success
        failureResponse = nil
    }

    init(failure: Error) {
        successResponse = nil
        failureResponse = failure
    }
}
