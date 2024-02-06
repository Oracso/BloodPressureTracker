//
//  CoreDataModifier.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData


struct CoreDataModifier {

    let context: NSManagedObjectContext
    
    init(_ context: NSManagedObjectContext) {
        self.context = context
    }
    
    
    
    // MARK: - Create Entity
    
    func createEntity(_ entityType: EntityType) -> NSManagedObject {
        switch entityType {
        case .log:
            return createLog()
        }
    }
    
    
    func createLog() -> Log {
        let example = Log(context: context)
        example.id = UUID()
        return example
    }
    
    

    

    
    
}

