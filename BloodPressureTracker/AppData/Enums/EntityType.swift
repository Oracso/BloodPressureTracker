//
//  EntityType.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData


enum EntityType: String, Identifiable, CaseIterable, Codable {
    case log = "Log"
    var id: Self { self }
}




extension EntityType {
    func entityClass() -> NSManagedObject.Type {
        switch self {
        case .log:
            return Log.self
        }
    }

    init<T: NSManagedObject>(classType: T.Type) {
        switch classType {
        case is Log.Type:
            self = .log
        default:
            fatalError("Unsupported NSManagedObject Type")
        }
    }
}

extension EntityType {
    func pluralRawValue() -> String {
        switch self {
        case .log:
            return "Logs"
        }
    }
}




// MARK: - EntityType initialisers from NSManagedObject

extension NSManagedObject {
    func entityType() -> EntityType? {
        EntityType(rawValue: entity.name ?? "entity description fail")
    }
}

extension NSManagedObject {
    func entityTypeRawValue() -> String {
        EntityType(rawValue: entity.name ?? "entity description fail")?.rawValue ?? "EntityType not found"
    }
}

// MARK: - EntityType initialisers from [NSManagedObject]

extension Array where Array == [NSManagedObject] {
    func arrayEntityType() -> EntityType? {
        if let first = self.first {
            return first.entityType()
        } else {
            return nil
        }
    }
}




