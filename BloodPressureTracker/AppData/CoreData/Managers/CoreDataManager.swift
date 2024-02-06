//
//  CoreDataManager.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData

struct CoreDataManager {
    
    // MARK: - init singleton
    
    static let shared = CoreDataManager()
  
    // MARK: - Model Names
    
    let modelName = "BloodPressureTrackerModel"
    
    
    // MARK: - NSPersistentContainer property
    
    let container: NSPersistentContainerSubClass
    
    // MARK: - NSPersistentContainer init()
    
    // An initialiser to load Core Data, either using an in-memory store
    // for temporary storage or normal disk data storage
    // true = uses ephemeral stores
    
    private init(inMemory: Bool = true) {
        container = NSPersistentContainerSubClass(name: modelName)
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                // TODO: Resolve FatalError()
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo) ----- Unable to load persistent stores: \(error.localizedDescription)")
                
            }
        })

        // container.viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        print("Persistent Container has been created \(inMemory ? "(EPHEMERAL STORES)" : "(PERMANENT STORES)")")
        
    }
    
    
    // MARK: - Static Preview
    
    static var preview: CoreDataManager = {
        let result = CoreDataManager()
        let viewContext = result.container.viewContext
 
        // MARK: load example objects
        
        _ = CoreDataPreviewManager(viewContext)
        
        // MARK: SAVE examples
        // TODO: I don't think it even needs to be saved..?
//        viewContext.saveIfChanges()
        
        return result
    }()
    
    
   
   
   
    
    
}



