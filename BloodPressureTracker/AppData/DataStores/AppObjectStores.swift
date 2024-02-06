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
    @Published var XXXOS: XXXObjectStore
    
    init(_ context: NSManagedObjectContext) {
        self.context = context
        self.logOS = LogObjectStore(context)
        self.XXXOS = XXXObjectStore(context)
    }
    
    
}


// MARK: - Generic Return All Objects

extension AppObjectStores {
    
    func allObjects(_ entityType: EntityType) -> [NSManagedObject] {
        switch entityType {
        case .log:
            return logOS.logs
        case .XXX:
            return XXXOS.XXX
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




// MARK: - CustomUUID Functionality

extension AppObjectStores {
    
    func returnObjectFromAllCustomUUIDs(_ customUUID: String) -> NSManagedObject? {
        let separated = customUUID.separateCustomUUID()
        let objects = allObjects(separated.entityType)
        return objects.returnObjectFromCustomUUID(customUUID)
    }
    
}




// MARK: - MappableEntity Functionality

// extension AppObjectStores {
    
//     func allMappableEntities() -> [MappableEntity] {
        
//         var array: [MappableEntity] = []
        
//         for entityType in EntityType.allCases {
            
//             var objects: [NSManagedObject] = []
            
//             switch entityType {
//             case .item:
//                 if Item.self is MappableEntity.Type {
//                     objects += allObjects(.item)
//                 }
//             case .category:
//                 if Category.self is MappableEntity.Type {
//                     objects += allObjects(.category)
//                 }
//             case .location:
//                 if Location.self is MappableEntity.Type {
//                     objects += allObjects(.location)
//                     print(objects.count)
//                 }
//             case .place:
//                 if Place.self is MappableEntity.Type {
//                     objects += allObjects(.place)
//                 }
//             }
            
//             array += objects as? [MappableEntity] ?? []
//         }
        
//         return array
//     }
// 
// }


