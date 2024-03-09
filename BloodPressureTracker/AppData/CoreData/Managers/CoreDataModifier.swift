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
    
    
    func createLog(date: Date = .now, diastolic: Int = 0, systolic: Int = 0, pulse: Int = 0, arm: ArmType = .right, confounders: [String:String] = [:], notes: String? = nil) -> Log {
        let log = Log(context: context)
        log.id = UUID()
        log.date = date
        log.diastolic = Int64(diastolic)
        log.systolic = Int64(systolic)
        log.pulse = Int64(pulse)
        log.arm = arm.rawValue
        if confounders.isEmpty {
            log.confounders = nil
        } else {
            log.confounders = JSONManager.dictionaryToJsonString(confounders)
        }
        log.notes = notes
        return log
    }
    
    

    

    
    
}

