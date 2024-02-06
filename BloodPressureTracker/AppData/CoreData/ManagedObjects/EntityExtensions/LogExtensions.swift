//
//  LogExtensions.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData


extension Log {
    
    public var unwrappedID: UUID {
        id ?? UUID()
    }

    // public var unwrappedName: String {
    //     name ?? "name found nil"
    // }
    

    // public var unwrappedDate: Date {
    //     date ?? .now
    // }

    public var unwrapped<#property#>: <#Type#> {
        <#property#> ?? <#example#>
    }
    
    // public var <#attribute#>Array: [<#Entity#>] {
    //      <#attribute#>.unwrap(<#Entity#>.self)
    // }
        
    
}


// MARK: - ObjectStore FetchRequest

extension Log {
    
    public class func objectStoreFetchRequest() -> NSFetchRequest<Log> {
        let request = NSFetchRequest<Log>(entityName: "Log")
            request.sortDescriptors = [NSSortDescriptor(key: "<#property#>", ascending: true)]
        
        return request
    }
    
    
    
    
    
}



// MARK: - Coding Keys

private enum CodingKeys : String, CodingKey {
    case id, name, <#property#>, XXX
}


// MARK: - Encodable

public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(id, forKey: .id)
    try container.encode(name, forKey: .name)

    // try container.encode(<#property#>, forKey: .<#property#>)
    
    // try container.encode(XXXArray.map({$0.id}), forKey: .XXX)
}


// MARK: - Decodable


public required convenience init(from decoder: Decoder) throws {
    
    
    guard let contextUserInfoKey = CodingUserInfoKey.context,
          let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
          let entity = NSEntityDescription.entity(forEntityName: "Log", in: managedObjectContext) else {  fatalError("Failed to decode Log!")  }
    
    self.init(entity: entity, insertInto: managedObjectContext)
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(UUID.self, forKey: .id)
    name = try container.decode(String.self, forKey: .name)

    // <#property#> = try container.decode(<#Type#>.self, forKey: .<#property#>)
    
    // let XXXArray = try container.decode([XXX].self, forKey: .XXX)
    // self.XXX = Set(XXXArray) as NSSet
    
    
    
}


extension Log: Codable { }





// MARK: - RelationalEntity Conformance

extension Log: RelationalEntity {
    
    typealias EntityRelationships = Relationships
 
    enum Relationships: String, CaseIterable {
        case XXX
    }
    
    func returnRelationship(_ relationship: Relationships) -> ObjectOrNSSet {
        switch relationship {
        // case .XXX:
        //     return ObjectOrNSSet(object: XXX)
        }
    }
    
    func returnRelationshipEntityType(_ relationship: Relationships) -> EntityType {
        switch relationship {
        // case .XXX:
        //     return .XXX
        }
    }
    
    func inverseRelationshipName(_ relationship: Relationships) -> String {
        switch relationship {
        // case .XXX:
        //     return "log"
        }
    }
    
}


// MARK: - ObjectPlaceholderCompatible Conformance

extension Log: ObjectPlaceholderCompatible {
    
    var placeholderObjectName: String { unwrapped<#property#> }
    
    var placeholderEntityType: EntityType { .<#entityType#> }
    
}

// MARK: - RelationalPlaceholderObject Conformance

extension Log: RelationalPlaceholderObject {
    
}