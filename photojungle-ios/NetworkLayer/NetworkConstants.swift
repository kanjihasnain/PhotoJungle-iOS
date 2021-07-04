//
//  NetworkConstants.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 01/07/2021.
//

struct NetworkUrls {
    
    static private let key = "22312431-e63caf6089d605916f6433298"
    
    static func getPhotosUrl(pageNumber page: String) -> String {
        "https://pixabay.com/api/?key=\(key)&category=transportation&image_type=photo&orientation=horizontal&safesearch=true&page=\(page)"
    }
}
