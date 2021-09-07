//
//  ArticleDataSync.swift
//  Zalak_DRCDemo
//
//  Created by Zalak on 07/09/21.
//  Copyright © 2021 Zalak. All rights reserved.
//

import Foundation
import CoreData

extension DBManager {
    
    func saveArticleWith(_ data: ArticleModel) {
        if let entityDesc = NSEntityDescription.entity(forEntityName: DemoEntities.articleEntity.name, in: managedContext) {
            let object = NSManagedObject(entity: entityDesc, insertInto: managedContext)
            object.setValue(data.author, forKey: "author")
            object.setValue(data.title, forKey: "title")
            object.setValue(data.newsDescription, forKey: "newsDescription")
            object.setValue(data.webLink, forKey: "webLink")
            object.setValue(data.urlToImage, forKey: "urlToImage")
            object.setValue(data.publishedAt, forKey: "publishedAt")
            object.setValue(data.content, forKey: "content")
            saveData()
        }
    }
    
    func fetchArticlesFromDB() -> [ArticleModel]{
        var articleData = [ArticleModel]()
        fetchQuery(entity: DemoEntities.articleEntity.name) { (fetchedObj) in
            articleData = fetchedObj.reduce(into: [ArticleModel]()) { (obj, asset) in
                obj.append(ArticleModel(data: asset))
            }
        }
        return articleData
    }
}
