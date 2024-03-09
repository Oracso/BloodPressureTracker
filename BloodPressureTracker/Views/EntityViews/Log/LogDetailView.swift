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
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var log: Log
    
    @EnvironmentObject var vem: ViewEditingManager
    
    
    var body: some View {
        
        
        List {

            Text("Systolic: \(log.systolic)")
            Text("Diastolic: \(log.diastolic)")
            Text("Pulse: \(log.pulse)")
            Text("Arm: \(log.unwrappedArm)")
            Text("Date: \(log.formattedDate)")

            
            ConfoundersSectionView(confoundersString: $log.confounders)


            GenericDeleteObjectButton(log, dismiss)
            
            
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
