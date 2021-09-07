//
//  NewsModel.swift
//  Zalak_DRCDemo
//
//  Created by Zalak on 07/09/21.
//  Copyright © 2021 Zalak. All rights reserved.
//

import Foundation
import CoreData

struct ArticleModel : Codable {
    let author          : String?
    let title           : String?
    let newsDescription : String?
    let webLink         : String?
    let urlToImage      : String?
    let publishedAt     : String?
    let content         : String?

}

extension ArticleModel {
    
    enum CodingKeys: String, CodingKey {

        case author             = "author"
        case title              = "title"
        case newsDescription    = "description"
        case webLink            = "url"
        case urlToImage         = "urlToImage"
        case publishedAt        = "publishedAt"
        case content            = "content"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        author      = try values.decodeIfPresent(String.self, forKey: .author)
        title       = try values.decodeIfPresent(String.self, forKey: .title)
        newsDescription = try values.decodeIfPresent(String.self, forKey: .newsDescription)
        webLink     = try values.decodeIfPresent(String.self, forKey: .webLink)
        urlToImage  = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        content     = try values.decodeIfPresent(String.self, forKey: .content)
    }
    
    init(data: NSManagedObject) {
        author              = data.value(forKey: "author") as? String ?? ""
        title               = data.value(forKey: "title") as? String ?? ""
        newsDescription     = data.value(forKey: "newsDescription") as? String ?? ""
        webLink             = data.value(forKey: "webLink") as? String ?? ""
        urlToImage          = data.value(forKey: "urlToImage") as? String ?? ""
        publishedAt         = data.value(forKey: "publishedAt") as? String ?? ""
        content             = data.value(forKey: "content") as? String ?? ""
       }
}

struct NewsResultModel : Codable {
    let status          : String?
    let totalResults    : Int?
    let articles        : [ArticleModel]?

    enum CodingKeys: String, CodingKey {

        case status         = "status"
        case totalResults   = "totalResults"
        case articles       = "articles"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status          = try values.decodeIfPresent(String.self, forKey: .status)
        totalResults    = try values.decodeIfPresent(Int.self, forKey: .totalResults)
        articles        = try values.decodeIfPresent([ArticleModel].self, forKey: .articles)
    }

}
