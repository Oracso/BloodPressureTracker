//
//  AllXView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import SwiftUI
import CoreData

struct AllXView: View {
    
    init(_ objects: [NSManagedObject], _ entityType: EntityType) {
        self.objects = objects
        self.entityType = entityType
    }
    
    let objects: [NSManagedObject]
    
    let gvm = GenericViewManager()
    
    
    // MARK: - Delete Object From List
    
    @EnvironmentObject var vem: ViewEditingManager
    
    @EnvironmentObject var ads: AppDataStore
    
    @State private var selectedObject: NSManagedObject?
    
    let entityType: EntityType
    
    var body: some View {


        NavigationStack {
            
            List {
                
                ForEach(objects) { object in
                   
                    NavigationLink {
                        XDetailView(object, true)
                        
                    } label: {
                        GenericViewManager.objectListRowView(object)
                    }
                    
                    
                }
                
                
            }
            
            
            .navigationTitle(GenericViewManager.navTitle(entityType))
            
            
            .toolbar {

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddObjectView(entityType, ads.context)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "person.circle")
                    }
                }
                
            }
            
            .overlay {
                if objects.isEmpty {
                    ContentUnavailableView {
                        Label("No \(entityType.pluralRawValue().lowercased()) found", systemImage: "tray.fill")
                    } description: {
                        Text("You need to create some \(entityType.pluralRawValue().lowercased())")
                    }
                }
            }
            
            
        }
        

        
        
    }
}

#Preview {
    AllXView(CoreDataPreviewManager.fetchAllPreviewObjects(.log), .log)
        .environment(\.managedObjectContext, CoreDataManager.preview.container.viewContext)
        .environmentObject(AppDataStore(CoreDataManager.preview.container.viewContext))
        .environmentObject(ViewEditingManager(CoreDataManager.preview.container.viewContext))
}







