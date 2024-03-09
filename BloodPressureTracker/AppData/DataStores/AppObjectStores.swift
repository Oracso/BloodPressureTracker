//
//  AppObjectStores.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData


class AppObjectStores: ObservableObject {
    
    let context: NSManagedObjectContext
    
    @Published var logOS: LogObjectStore
    
    init(_ context: NSManagedObjectContext) {
        self.context = context
        self.logOS = LogObjectStore(context)
    }
    
    
}


// MARK: - Generic Return All Objects

extension AppObjectStores {
    
    func allObjects(_ entityType: EntityType) -> [NSManagedObject] {
        switch entityType {
        case .log:
            return logOS.logs
        }
    }
    
    func compileEntityTypeObjectsIntoArray(_ entityTypes: [EntityType]) -> [NSManagedObject] {
        var array: [NSManagedObject] = []
        for entityType in entityTypes {
            array.append(contentsOf: allObjects(entityType))
        }
        return array
    }
    
    
}




