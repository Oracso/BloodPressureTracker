//
//  ChartDateFilterView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 11/03/2024.
//

import SwiftUI

struct ChartDateFilterView: View {
    
    @ObservedObject var logStatsManager: LogStatsManager
    
    var body: some View {
        VStack {
            Picker("Date Period", selection: $logStatsManager.datePeriod) {
                ForEach(DateFilterPeriod.allCases) { datePeriod in
                    Text(datePeriod.rawValue.capitalized)
                        .tag(datePeriod.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            if logStatsManager.datePeriod == .custom {
                DatePicker("From Date", selection: $logStatsManager.fromDate, displayedComponents: [.date])
                
                DatePicker("To Date", selection: $logStatsManager.toDate, displayedComponents: [.date])
            }
            
            
            
        }
        
        
        .onChange(of: logStatsManager.datePeriod) {
            
        }
        
        .onChange(of: logStatsManager.fromDate) {
            if logStatsManager.datePeriod == .custom {
                logStatsManager.filterLogsByDate()
            }
        }
        
        .onChange(of: logStatsManager.toDate) {
            if logStatsManager.datePeriod == .custom {
                logStatsManager.filterLogsByDate()
            }
        }
        
        
    }
}

#Preview {
    ChartDateFilterView(logStatsManager: LogStatsManager(allLogs: CoreDataPreviewManager.previewManager.fetcher.fetchAllObjects(.log)))
}
