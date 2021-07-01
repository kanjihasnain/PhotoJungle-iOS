//
//  APIClient.swift
//  photojungle-ios
//
//  Created by Kanji on 01/07/2021.
//

import Foundation

public typealias URLResponse = Result<(data: Data, response: HTTPURLResponse), Error>

open class APIClient {
    
    public init() { }
    
    open func dataTask(_ request: URLRequest,
                       completionHandler: @escaping (URLResponse) -> Void) -> URLSessionDataTask {
        
        let startDate = Date()
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data, let response = response as? HTTPURLResponse {
                
                let executionTime = Date().timeIntervalSince(startDate)
                print("URL Response Time: \(executionTime)")
                
                completionHandler(.success((data, response)))
            } else {
                let error = error ?? NSError(domain: "Error", code: 9999, userInfo: [:])
                completionHandler(.failure(error))
            }
        }
        task.resume()
        return task
    }
}
