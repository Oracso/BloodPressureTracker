//
//  NSManagedObject.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData

public typealias NSManagedObject = CoreData.NSManagedObject

extension NSManagedObject {
    
    
    class func customObjectsFetchRequest(_ type: FetchRequestType, context: NSManagedObjectContext) -> [NSManagedObject] {
        
        let fetchRequest = customiseFetchRequest(type)
        
        let examples: [NSManagedObject]
        
        do {
            examples = try context.fetch(fetchRequest)
        } catch {
            examples = []
        }
        
        return examples
        
    }
    
    class func singleObjectFetchRequest(context: NSManagedObjectContext) -> NSManagedObject? {
        
        let fetchRequest = customiseFetchRequest(.single)
        
        let example: NSManagedObject?
        
        do {
            example = try context.fetch(fetchRequest).first
        } catch {
            example = nil
        }
        
        return example
        
    }
    
  
    
    
    
    class private func customiseFetchRequest(_ type: FetchRequestType) -> NSFetchRequest<NSManagedObject> {
        
        let request = NSFetchRequest<NSManagedObject>(entityName: entity().name ?? "Unwrap Fail")
        
        switch type {
        case .single:
            request.fetchLimit = 1
        case .all:
            print("")
        case .objectStore:
            print("")
            // TODO: Can't use NSSortDescriptor here as don't know what the key would be
    //            request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        }
        
        return request
    }
    
    
    enum FetchRequestType {
        case single
        case all
        case objectStore
    }
    
    
    
    
}


extension NSManagedObject: Identifiable {
    
}


// extension NSManagedObject {
    
//      func returnChildContext(_ context: NSManagedObjectContext) -> NSManagedObjectContext {
//         // Initialize Managed Object Context
//         let childContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

//         // Configure Managed Object Context
//         childContext.parent = context

//         return childContext
//     }
    
    
// }


// MARK: - Class Casting

extension NSManagedObject {
    
    func castedAsLog() -> Log {
        self as! Log
    }
    
    func castedAsXXX() -> XXX {
        self as! XXX
    }
    
    
    
    
}



extension Array where Array == [NSManagedObject] {
    func asNSSet() -> NSSet {
        NSSet(array: self)
    }
}


// MARK: - Unwrap NSSet? to [T]

extension Optional where Wrapped == NSSet {
    func unwrap<T: NSManagedObject>(_ classType: T.Type) -> [T] {
        guard let set = self as? Set<T> else {
            return []
        }
        return Array(set)
    }
}


extension NSManagedObjectContext {
    convenience init(_ parentContext: NSManagedObjectContext, _ mergeFromParent: Bool = true) {
        self.init(concurrencyType: .mainQueueConcurrencyType)
        self.automaticallyMergesChangesFromParent = mergeFromParent
        self.parent = parentContext
    }
}


