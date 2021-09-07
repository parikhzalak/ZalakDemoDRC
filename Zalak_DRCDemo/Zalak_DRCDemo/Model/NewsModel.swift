//
//  NewsModel.swift
//  Zalak_DRCDemo
//
//  Created by Zalak on 07/09/21.
//  Copyright © 2021 Zalak. All rights reserved.
//

import Foundation

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

struct ArticleModel : Codable {
    let source      : SourceModel?
    let author      : String?
    let title       : String?
    let description : String?
    let webLink     : String?
    let urlToImage  : String?
    let publishedAt : String?
    let content     : String?

    enum CodingKeys: String, CodingKey {

        case source         = "source"
        case author         = "author"
        case title          = "title"
        case description    = "description"
        case webLink        = "url"
        case urlToImage     = "urlToImage"
        case publishedAt    = "publishedAt"
        case content        = "content"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source      = try values.decodeIfPresent(SourceModel.self, forKey: .source)
        author      = try values.decodeIfPresent(String.self, forKey: .author)
        title       = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        webLink     = try values.decodeIfPresent(String.self, forKey: .webLink)
        urlToImage  = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        content     = try values.decodeIfPresent(String.self, forKey: .content)
    }

}


struct SourceModel : Codable {
    let id      : String?
    let name    : String?

    enum CodingKeys: String, CodingKey {

        case id     = "id"
        case name   = "name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id          = try values.decodeIfPresent(String.self, forKey: .id)
        name        = try values.decodeIfPresent(String.self, forKey: .name)
    }

}
