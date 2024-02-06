//
//  LogObjectStore.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData


class LogObjectStore: NSObject, ObservableObject {
    
    @Published var logs: [Log] = []
    private let controller: NSFetchedResultsController<Log>
    
    init(_ context: NSManagedObjectContext) {
        controller = NSFetchedResultsController(
            fetchRequest: Log.objectStoreFetchRequest(),
            managedObjectContext: context,
            sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        controller.delegate = self
        
        do {
            try controller.performFetch()
            logs = controller.fetchedObjects ?? []
        } catch {
            print("failed to fetch logs!")
        }
    }
}

extension LogObjectStore: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let fetchedObjects = controller.fetchedObjects as? [Log]
        else { return }
        logs = fetchedObjects
    }
}
