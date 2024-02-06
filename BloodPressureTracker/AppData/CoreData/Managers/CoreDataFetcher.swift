//
//  CoreDataFetcher.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData


struct CoreDataFetcher {
    
    
    
    let context: NSManagedObjectContext
    
    
    init(_ context: NSManagedObjectContext) {
        self.context = context
    }
    
    
    // MARK: - Generic Fetch Requests
    
    
    // MARK: - Multiple Fetch Requests
    
    
    func fetchAllObjects<T: NSManagedObject>(_ entityType: EntityType) -> [T] {
        fetchAllObjectsFromEntityClass(entityType.entityClass()) as! [T]
    }
    
    
    private func fetchAllObjectsFromEntityClass(_ entityClass: NSManagedObject.Type) -> [NSManagedObject] {
        entityClass.customObjectsFetchRequest(.all, context: context)
    }
    
    
    // MARK: - Single Fetch Requests
    
    
    func fetchObject(_ entityType: EntityType) -> NSManagedObject? {
        fetchObjectFromEntityClass(entityType.entityClass())
    }
    
    
    private func fetchObjectFromEntityClass(_ entityClass: NSManagedObject.Type) -> NSManagedObject? {
        entityClass.singleObjectFetchRequest(context: context)
    }




   
    
}





