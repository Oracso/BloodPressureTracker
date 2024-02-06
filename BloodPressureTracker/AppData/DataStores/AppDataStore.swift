//
//  AppDataStore.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData

class AppDataStore: ObservableObject {
    
    let context: NSManagedObjectContext
    
    @Published var refreshID = UUID()
    
    @Published var objects: AppObjectStores
    
    let fetcher: CoreDataFetcher
    let modifier: CoreDataModifier
    
    init(_ context: NSManagedObjectContext) {
        self.context = context
        self.objects = AppObjectStores(context)
        self.fetcher = CoreDataFetcher(context)
        self.modifier = CoreDataModifier(context)
        
        // Load Starting Data
        
        // Validate Existing Data
        
        // Save Context
        
    }
    
    
}



extension AppDataStore {
    func refresh() { refreshID = UUID() }
}


// MARK: - Generic All Object Calls/Returns?

extension AppDataStore {
    func allObjects(_ entityType: EntityType) -> [NSManagedObject] {
        objects.allObjects(entityType)
    }
}




// MARK: - CustomUUID Functionality

extension AppDataStore {
    
    func returnObjectFromAllCustomUUIDs(_ customUUID: String) -> NSManagedObject? {
        objects.returnObjectFromAllCustomUUIDs(customUUID)
    }
    
    func returnObjectsFromAllCustomUUIDs(_ customUUIDs: [String]) -> [NSManagedObject] {
        var array: [NSManagedObject] = []
        for customUUID in customUUIDs {
            if let object = returnObjectFromAllCustomUUIDs(customUUID) {
                array.append(object)
            }
        }
        return array
    }
    
}


// MARK: - Check Object Can Save 
 
extension AppDataStore {
    
    func checkCanSave(_ entityType: EntityType, object: NSManagedObject) -> Bool {
        switch entityType {
        case .log:
            checkCanSaveLog(object.castedAsLog())
        case .XXX:
            checkCanSaveXXX(object.castedAsXXX())
        }
        
    }
    
    private func checkCanSaveLog(_ object: Log) -> Bool {
        objects.logOS.logs.contains(where: { $0.<#property#>.lowercased() == object.<#property#>.lowercased() })
    }
    
    private func checkCanSaveXXX(_ object: XXX) -> Bool {
        objects.XXXOS.XXX.contains(where: { $0.<#property#>.lowercased() == object.<#property#>.lowercased() })
    }
    
    
}

