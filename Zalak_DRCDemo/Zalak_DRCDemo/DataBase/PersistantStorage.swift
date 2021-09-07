//
//  PersistantStorage.swift
//  Zalak_DRCDemo
//
//  Created by Zalak on 07/09/21.
//  Copyright © 2021 Zalak. All rights reserved.
//

import Foundation
import CoreData

//SingleTon pattern
final class PersistantStorage {
    
    
    static let shared = PersistantStorage()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Zalak_DRCDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext
    
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
