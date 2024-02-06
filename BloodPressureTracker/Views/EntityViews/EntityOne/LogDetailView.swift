//
//  LogDetailView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import SwiftUI

struct LogDetailView: View {

    init(_ log: Log) {
        self.log = log
    }
    
    @ObservedObject var log: Log
    
    @EnvironmentObject var vem: ViewEditingManager
    
    
    var body: some View {
        
        
        List {


            if vem.editMode == .inactive {
                Text(log.unwrappedName.capitalized)
            } else {
                TextField("New Name", text: $log.name.defaultValue(""))
            }
            
            

            // if vem.editMode == .inactive {
            //     Text(log.unwrapped<#property#>.capitalized)
            // } else {
            //     TextField("New <#property#>", text: $log.<#property#>.defaultValue("Optional Fail"))
            // }


            // Section("XXX") {
            //     if vem.editMode == .inactive {
            //             if let XXX = log.XXX {
            //                 NavigationLink {
            //                     XXXDetailView(XXX)
            //                 } label: {
            //                     GenericViewManager.XXXListRowView(XXX)
            //                 }
            //                 .disabled(vem.isEditing)
            //             } else {
            //                 Button("Choose XXX") { vem.activeEditMode() }
            //             }
            //         } else {
            //             ToOnePickerParentView(objectSelection: $log.XXX, entityType: .XXX, context: vem.context)
            //         }
            // }





            

            Section {
                ForEach(log.XXXArray) { XXX in
                    NavigationLink {
                        XXXDetailView(XXX)
                    } label: {
                        GenericViewManager.tagListRowView(XXX)
                    }
//                    .disabled(vem.isEditing)

                }
                
            } header: {
                HStack {
                    Text("XXX")
                    Spacer()
                    if vem.editMode == .active {
                        NavigationLink {
                            ToManyListParentView(object: log, selectedObjects: $log.XXX, toManyFilterType: .manyToMany, relationshipName: .XXX)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }   
                }
            }
            
                

            
        }
        
        .navigationTitle(log.unwrapped<#property#>.capitalized)

        
    }
}


#Preview {
    NavigationStack {
        LogDetailView(CoreDataPreviewManager.fetchPreviewObject(.log))
            .environmentObject(ViewEditingManager(CoreDataManager.preview.container.viewContext))
    }
}
