//
//  LogExtensions.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData


extension Log {
    
//    public var unwrappedID: UUID {
//        id ?? UUID()
//    }

    // public var unwrappedName: String {
    //     name ?? "name found nil"
    // }
    

     public var unwrappedArm: String {
         arm ?? "no record found"
     }

//    public var unwrapped<#property#>: <#Type#> {
//        <#property#> ?? <#example#>
//    }
    
    // public var <#attribute#>Array: [<#Entity#>] {
    //      <#attribute#>.unwrap(<#Entity#>.self)
    // }
        
    public var unwrappedDate: Date {
        date ?? .now
    }
    
    public var formattedDate: String {
        DateFormatter.localizedString(from: date ?? .now, dateStyle: .medium, timeStyle: .short)
    }
    
    public var listDate: String {
        DateFormatter.localizedString(from: date ?? .now, dateStyle: .short, timeStyle: .short)
    }
    
    
    public var diastolicInt: Int {
        Int(diastolic)
    }
    
    public var systolicInt: Int {
        Int(systolic)
    }
    
    public var pulseInt: Int {
        Int(pulse)
    }
    
}


// MARK: - ObjectStore FetchRequest

extension Log {
    
    public class func objectStoreFetchRequest() -> NSFetchRequest<Log> {
        let request = NSFetchRequest<Log>(entityName: "Log")
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        
        return request
    }

}


//extension Log {
//    static let timeArray: [Log] = [
//        Log(systolic: 174, diastolic: 78, pulse: 50, arm: "right", date: Date.daysDif(-5)),
//        Log(systolic: 145, diastolic: 62, pulse: 50, arm: "right", date: Date().daysBack(4)),
//        Log(systolic: 130, diastolic: 58, pulse: 50, arm: "left", date: Date().daysBack(3)),
//        TestLog(systolic: 178, diastolic: 83, pulse: 50, arm: "right", date: Date().daysBack(2)),
//        TestLog(systolic: 190, diastolic: 91, pulse: 50, arm: "left", date: Date().daysBack(1)),
//        TestLog(systolic: 166, diastolic: 65, pulse: 50, arm: "right", date: Date().daysBack(5)),
//        TestLog(systolic: 150, diastolic: 64, pulse: 50, arm: "right", date: Date().daysBack(4).plusHour(1)),
//        TestLog(systolic: 180, diastolic: 70, pulse: 60, arm: "right" , date: Date().daysBack(3).plusHour(1)),
//        TestLog(systolic: 200, diastolic: 80, pulse: 75, arm: "left" , date: Date().daysBack(2).plusHour(1)),
//        TestLog(systolic: 180, diastolic: 75, pulse: 70, arm: "right" , date: Date().daysBack(1)),
//        TestLog(systolic: 220, diastolic: 90, pulse: 80, arm: "left" , date: Date.now),
//    ]
//}



//// MARK: - Coding Keys
//
//private enum CodingKeys : String, CodingKey {
//    case id, name, <#property#>, XXX
//}
//
//
//// MARK: - Encodable
//
//public func encode(to encoder: Encoder) throws {
//    var container = encoder.container(keyedBy: CodingKeys.self)
//    try container.encode(id, forKey: .id)
//    try container.encode(name, forKey: .name)
//
//    // try container.encode(<#property#>, forKey: .<#property#>)
//    
//    // try container.encode(XXXArray.map({$0.id}), forKey: .XXX)
//}
//
//
//// MARK: - Decodable
//
//
//public required convenience init(from decoder: Decoder) throws {
//    
//    
//    guard let contextUserInfoKey = CodingUserInfoKey.context,
//          let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
//          let entity = NSEntityDescription.entity(forEntityName: "Log", in: managedObjectContext) else {  fatalError("Failed to decode Log!")  }
//    
//    self.init(entity: entity, insertInto: managedObjectContext)
//    let container = try decoder.container(keyedBy: CodingKeys.self)
//    
//    id = try container.decode(UUID.self, forKey: .id)
//    name = try container.decode(String.self, forKey: .name)
//
//    // <#property#> = try container.decode(<#Type#>.self, forKey: .<#property#>)
//    
//    // let XXXArray = try container.decode([XXX].self, forKey: .XXX)
//    // self.XXX = Set(XXXArray) as NSSet
//    
//    
//    
//}
//
//
//extension Log: Codable { }







