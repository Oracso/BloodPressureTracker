//
//  AddLogView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import SwiftUI

struct AddLogView: View {
    
    init(_ log: Log) {
        self.log = log
    }
    
    @ObservedObject var log: Log
    
    @EnvironmentObject var vem: ViewEditingManager

    var body: some View {
        
        List {
            
            TextField("<#property#>", text: $log.<#property#>.defaultValue(<#property#>))
            


//             Section {
//                 ForEach(log.XXXArray) { XXX in
//                     NavigationLink {
//                         XXXDetailView(XXX)
//                     } label: {
//                         GenericViewManager.tagListRowView(XXX)
//                     }
// //                    .disabled(vem.isEditing)

//                 }
                
//             } header: {
//                 HStack {
//                     Text("XXX")
//                     Spacer()
//                     if vem.editMode == .active {
//                         NavigationLink {
//                             ToManyListParentView(object: log, selectedObjects: $log.XXX, toManyFilterType: .manyToMany, relationshipName: .XXX)
//                                 .environment(\.managedObjectContext, vem.context)
//                                 .environmentObject(vem)
//                         } label: {
//                             Image(systemName: "plus")
//                         }
//                     }   
//                 }
//             }





        }
        
        .navigationTitle("Add Log")
        
        
    }
}

#Preview {
    NavigationStack {
        AddLogView(ChildContextObjectContainer(CoreDataManager.preview.container.viewContext, .log).object.castedAsLog())
    }
}
