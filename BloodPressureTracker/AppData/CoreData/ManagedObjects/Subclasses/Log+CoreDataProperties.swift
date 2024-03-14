//
//  Log+CoreDataProperties.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//
//

import Foundation
import CoreData


extension Log {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Log> {
        return NSFetchRequest<Log>(entityName: "Log")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var arm: String?
    @NSManaged public var confounders: String?
    @NSManaged public var date: Date?
    @NSManaged public var diastolic: Int64
    @NSManaged public var notes: String?
    @NSManaged public var pulse: Int64
    @NSManaged public var systolic: Int64

}

