//
//  StatisticsView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 08/02/2024.
//

import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var ads: AppDataStore
    @StateObject var statisticsManager = StatisticsManager()
    var body: some View {
        NavigationStack {
            List {
                
                
                Section("Log Averages:") {
                    LogAveragesView()
                }
                
                
                
                Section("Chart:") {
                    
                    StatisticsChartParentView(allLogs: ads.objects.logOS.logs)
                    
                    
                }
                
       
                
            }
            
            .navigationTitle("Statistics")
        }
        
        .environmentObject(StatisticsManager())
    }
}

#Preview {
    StatisticsView()
        .environmentObject(AppDataStore(CoreDataPreviewManager.previewManager.context))
        .environmentObject(StatisticsManager())
        .environmentObject(SettingsManager())
}
