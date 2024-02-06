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
    
//    @EnvironmentObject var vem: ViewEditingManager
    
    
    var body: some View {
        
        
        List {

            Text("Systolic: \(log.systolic)")
            Text("Diastolic: \(log.diastolic)")
            Text("Pulse: \(log.pulse)")
            Text("Arm: \(log.unwrappedArm)")
            Text("Date: \(log.formattedDate)")

//            if vem.editMode == .inactive {
//                Text(log.unwrappedName.capitalized)
//            } else {
//                TextField("New Name", text: $log.name.defaultValue(""))
//            }
            
            

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





            

            
                

            
        }
        
        .navigationTitle(log.formattedDate)

        
    }
}


#Preview {
    NavigationStack {
        LogDetailView(CoreDataPreviewManager.fetchPreviewObject(.log))
            .environmentObject(ViewEditingManager(CoreDataManager.preview.container.viewContext))
    }
}
