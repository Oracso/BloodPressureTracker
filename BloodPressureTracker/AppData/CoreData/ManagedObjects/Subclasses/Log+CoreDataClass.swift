//
//  Log+CoreDataClass.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//
//

import Foundation
import CoreData

@objc(Log)
public class Log: NSManagedObject {
    
    // MARK: - Coding Keys

    private enum CodingKeys : String, CodingKey {
        case id, arm, confounders, date, diastolic, notes, pulse, systolic
    }


    // MARK: - Encodable

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(arm, forKey: .arm)
        try container.encode(confounders, forKey: .confounders)
        try container.encode(date, forKey: .date)
        try container.encode(diastolic, forKey: .diastolic)
        try container.encode(notes, forKey: .notes)
        try container.encode(pulse, forKey: .pulse)
        try container.encode(systolic, forKey: .systolic)
        
    }


    // MARK: - Decodable

    public required convenience init(from decoder: Decoder) throws {
        
        
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Log", in: managedObjectContext) else {  fatalError("Failed to decode Log!")  }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        arm = try container.decode(String.self, forKey: .arm)
        confounders = try container.decode(String.self, forKey: .confounders)
        date = try container.decode(Date.self, forKey: .date)
        diastolic = try container.decode(Int64.self, forKey: .diastolic)
        notes = try container.decode(String.self, forKey: .notes)
        pulse = try container.decode(Int64.self, forKey: .pulse)
        systolic = try container.decode(Int64.self, forKey: .systolic)

        
    }


    
}


extension Log: Codable { }
