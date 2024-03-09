//
//  GenericViewManager.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData
import SwiftUI

struct GenericViewManager {
   

    // MARK: - Entity Detail View


    @ViewBuilder func objectDetailView(_ object: NSManagedObject) -> some View {
        if let unwrappedEntityType = object.entityType() {
            switch unwrappedEntityType {
            case .log:
                LogDetailView(object.castedAsLog())
            }
        } else {
            nilDetailView()
        }
    }



    

    // MARK: - View Navigation Titles
    
    static func navTitle(_ entityType: EntityType) -> String {
        "All \(entityType.pluralRawValue())"
    }
    
    private func nilDetailView() -> some View {
        Text("No Entity Type Found")
    }
    
    private static func nilListRowView() -> some View {
        Text("No Entity Type Found")
    }
    
    
    
}


extension GenericViewManager {
    
    
    // MARK: - Add Object View
    
    @ViewBuilder func addObjectView(_ object: NSManagedObject) -> some View {
        if let unwrappedEntityType = object.entityType() {
            switch unwrappedEntityType {
            case .log:
                AddLogView(object.castedAsLog())
            }
        }
        
    }
    
    
}




// MARK: - Entity List Row Views

extension GenericViewManager {
    

     // MARK: - List Row View

    
    @ViewBuilder static func objectListRowView(_ object: NSManagedObject) -> some View {
        if let unwrappedEntityType = object.entityType() {
            switch unwrappedEntityType {
            case .log:
                logListRowView(object.castedAsLog())
            }
        } else {
            nilListRowView()
        }
    }



    
    static func logListRowView(_ object: Log) -> some View {
        HStack {
            Spacer()
            Text(object.formattedDate)
            Spacer()
            VStack {
                Text(String(object.systolic))
                Divider()
                Text(String(object.diastolic))
            }
            .frame(maxWidth: 50)
        }
    }
    

    
    
    
}


