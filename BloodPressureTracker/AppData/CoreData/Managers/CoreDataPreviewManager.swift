//
//  CoreDataPreviewManager.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData
import SwiftUI


struct CoreDataPreviewManager {
    
    init(_ context: NSManagedObjectContext, isStatic: Bool = false) {
        self.context = context
        self.fetcher = CoreDataFetcher(context)
        self.modifier = CoreDataModifier(context)
        
        
        if isStatic == false {
            initExampleData()
        }
    }
    
    let context: NSManagedObjectContext
    
    var fetcher: CoreDataFetcher
    
    var modifier: CoreDataModifier
    
    
    
    func initExampleData() {

//        createAllExampleObjects([.log], 5)
        
        // Add entity relationships

        // linkOneToManyEntities(Log.self, XXX.self, .XXX)
        
        context.saveIfChanges()
    }
    
    
    
    
    // MARK: - Create Randomised Object Data
    
    private func createRandomisedObjects<T: NSManagedObject>(_ entityType: EntityType, _ quantity: Int) -> [T] {
        
        var examples: [T] = []
        
        let edg = ExampleDataGenerator()
        let randomisedObjects = edg.createAllRandomisedObjects(entityType.withSpaces, quantity)
        
        for random in randomisedObjects {
            examples.append(createObjectFromRandomisedObjectData(entityType: entityType, random))
        }
        
        return examples
        
    }
    
    // MARK: - Create Object from Randomised Data
    
    private func createObjectFromRandomisedObjectData<T: NSManagedObject>(entityType: EntityType, _ ran: RandomisedObjectData) -> T {
        
        switch entityType {
        case .log:
            return modifier.createLog() as! T
        }
        
    }
    
    
    // MARK: - Create Entities
    
    func createAllExampleObjects(_ entityTypes: [EntityType], _ quantity: Int) {
        for entityType in entityTypes {
            let _ = createRandomisedObjects(entityType, quantity)
        }
    }
    
    
    
    
    // MARK: - SwiftUI Preview Code
    
    static var previewManager: CoreDataPreviewManager {
        CoreDataPreviewManager(CoreDataManager.preview.container.viewContext, isStatic: true)
    }
    
    
    
    // MARK: - All Preview Objects
    
    static func fetchAllPreviewObjects<T: NSManagedObject>(_ entityType: EntityType) -> [T] {
        previewManager.fetcher.fetchAllObjects(entityType) as! [T]
    }
    
    
    
    // MARK: - Single Preview Object
    
    
    static func fetchPreviewObject<T: NSManagedObject>(_ entityType: EntityType) -> T {
        let fetched = previewManager.fetcher.fetchObject(entityType)
        if let fetched {
            return fetched as! T
        } else {
            return previewManager.modifier.createEntity(entityType) as! T
        }
    }




    // MARK: - Fetch Object With Binding
    
    static func fetchObjectWithBinding<T: NSManagedObject>(_ entityType: EntityType) -> Binding<T> {
        
        var object: T
        
        switch entityType {
        case .log:
            object = fetchPreviewObject(.log)
        }
        
        return createObjectBinding(object)
    }
    
    
    static private func createObjectBinding<T: NSManagedObject>(_ value: T) -> Binding<T> {
        var bindingValue = value
        return Binding(
            get: { bindingValue },
            set: { newValue in
                bindingValue = newValue
            }
        )
    }
    
    
    
    // MARK: - ObjectPlaceholder Examples
    
    
    
    static func allEntityObjectPlaceholderExamples(_ entityType: EntityType) -> [ObjectPlaceholderDetails] {
        let objects = self.fetchAllPreviewObjects(entityType)
        return ObjectPlaceholderDetailsManager().createAllEntityObjectPlaceholderDetails(objects)
    }




    
}


