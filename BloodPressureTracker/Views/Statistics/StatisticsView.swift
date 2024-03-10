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
                    
                    
//                    StatisticsChartParentView(allLogs: ads.objects.logOS.logs)
                    
                    
                    
                    
                    
                }
                
                
                
                
                Section("Charts:") {
                    
                    //                LineGraphParentView(allLogs: $logDataObject.logArray, filterTypes: [.date])
                    //                    .frame(minHeight: 400)
                    NavigationLink {
                        // need to pass in already filtered dates????
                        ScrollView {
                            //                        LineGraphParentView(allLogs: $logDataObject.logArray, filterTypes: [.date, .dataType])
                            //                            .frame(minHeight: 600)
                        }
                        
                    } label: {
                        Text("Filter Data Type")
                    }
                    
                    
                }
                
                
                Section("Stats:") {
                    NavigationLink {
                        //                    CustomStatView(allLogs: logDataObject.logArray)
                    } label: {
                        Text("Custom Stats")
                    }
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
}
