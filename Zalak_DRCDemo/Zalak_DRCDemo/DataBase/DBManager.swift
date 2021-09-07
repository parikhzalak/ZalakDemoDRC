//
//  DBManager.swift
//  Zalak_DRCDemo
//
//  Created by Zalak on 07/09/21.
//  Copyright © 2021 Zalak. All rights reserved.
//

import Foundation
import CoreData
import UIKit

enum DemoEntities: CaseIterable {
    case articleEntity
    
    var name: String {
        switch self {
        case .articleEntity:
            return "ArticleEntity"
        }
    }
}

class DBManager {
    // MARK: - ManagedContext
    let managedContext = PersistantStorage.shared.context
    
    // MARK: - Get Instance
    static let shared = DBManager()
    
    // MARK: - Fetch Query
    func fetchQuery(entity: String, completionSuccess: (_ response: [NSManagedObject]) -> Void) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            completionSuccess(result as! [NSManagedObject])
        } catch let error as NSError {
            print("Failed fetchSettingsResult error :- \(error.localizedDescription)")
        }
    }
    
    // MARK: - Save -
    func saveData() {
        do {
            try managedContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
