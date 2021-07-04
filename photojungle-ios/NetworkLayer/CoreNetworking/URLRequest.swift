//
//  URLRequest.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 01/07/2021.
//

import Foundation

extension URLRequest {
    
    public init(url: String, method: HTTPMethod, header: [String: String]?, body: Any?) {
        
        guard let requestURL = URL(string: url) else { fatalError("URL is not created") }
        
        print("Last Called URL: \(requestURL)")
        print("Last Called Para: \(body ?? "")")
        
        self.init(url: requestURL)
        self.timeoutInterval = 30.0
        
        self.method = method
        
        if let header = header {
            header.forEach { self.setValue($0.value, forHTTPHeaderField: $0.key) }
        }
        
        if let body = body {
            let httpBody: Data
            do {
                httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
                self.httpBody = httpBody
            } catch {
                return
            }
        }
    }
}
