//
//  Items.swift
//  PhotoJungle-iOS
//
//  Created by HasnainKanji on 01/07/2021.
//

import Foundation

struct Items: Codable {
    
    var collections : Int?
    var comments : Int?
    var downloads : Int?
    var id : Int?
    var imageHeight : Int?
    var imageSize : Int?
    var imageWidth : Int?
    var largeImageURL : String?
    var likes : Int?
    var pageURL : String?
    var previewHeight : Int?
    var previewURL : String?
    var previewWidth : Int?
    var tags : String?
    var type : String?
    var user : String?
    var userImageURL : String?
    var userId : Int?
    var views : Int?
    var webformatHeight : Int?
    var webformatURL : String?
    var webformatWidth : Int?
    
    enum CodingKeys: String, CodingKey {
        case collections = "collections"
        case comments = "comments"
        case downloads = "downloads"
        case id = "id"
        case imageHeight = "imageHeight"
        case imageSize = "imageSize"
        case imageWidth = "imageWidth"
        case largeImageURL = "largeImageURL"
        case likes = "likes"
        case pageURL = "pageURL"
        case previewHeight = "previewHeight"
        case previewURL = "previewURL"
        case previewWidth = "previewWidth"
        case tags = "tags"
        case type = "type"
        case user = "user"
        case userImageURL = "userImageURL"
        case userId = "user_id"
        case views = "views"
        case webformatHeight = "webformatHeight"
        case webformatURL = "webformatURL"
        case webformatWidth = "webformatWidth"
    }
    
    init(from decoder: Decoder) throws {
        do {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            collections = try values.decodeIfPresent(Int.self, forKey: .collections)
            comments = try values.decodeIfPresent(Int.self, forKey: .comments)
            downloads = try values.decodeIfPresent(Int.self, forKey: .downloads)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            imageHeight = try values.decodeIfPresent(Int.self, forKey: .imageHeight)
            imageSize = try values.decodeIfPresent(Int.self, forKey: .imageSize)
            imageWidth = try values.decodeIfPresent(Int.self, forKey: .imageWidth)
            largeImageURL = try values.decodeIfPresent(String.self, forKey: .largeImageURL)
            likes = try values.decodeIfPresent(Int.self, forKey: .likes)
            pageURL = try values.decodeIfPresent(String.self, forKey: .pageURL)
            previewHeight = try values.decodeIfPresent(Int.self, forKey: .previewHeight)
            previewURL = try values.decodeIfPresent(String.self, forKey: .previewURL)
            previewWidth = try values.decodeIfPresent(Int.self, forKey: .previewWidth)
            tags = try values.decodeIfPresent(String.self, forKey: .tags)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            user = try values.decodeIfPresent(String.self, forKey: .user)
            userImageURL = try values.decodeIfPresent(String.self, forKey: .userImageURL)
            userId = try values.decodeIfPresent(Int.self, forKey: .userId)
            views = try values.decodeIfPresent(Int.self, forKey: .views)
            webformatHeight = try values.decodeIfPresent(Int.self, forKey: .webformatHeight)
            webformatURL = try values.decodeIfPresent(String.self, forKey: .webformatURL)
            webformatWidth = try values.decodeIfPresent(Int.self, forKey: .webformatWidth)
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print(error)
            print(error.localizedDescription)
        }
    }
    
    func getViewModel() -> ItemViewModel {
        ItemViewModel(thumbnailsUrl: webformatURL ?? "")
    }
}
