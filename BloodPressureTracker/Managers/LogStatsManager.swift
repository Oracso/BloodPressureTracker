//
//  LogStatsManager.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 10/03/2024.
//

import Foundation

class LogStatsManager: ObservableObject {
    internal init(allLogs: [Log]) {
        self.allLogs = allLogs
        self.filteredLogs = allLogs
    }
    
    
    
    let allLogs: [Log]
    
    @Published var filteredLogs: [Log] = []
    
    @Published var dataTypeSelection: LogDataSelectionType = .all
    
    
    
    
    // MARK: - Date Filter
    
    @Published var datePeriod: DateFilterPeriod = .week
    
    @Published var fromDate: Date = .daysDif(-7)
    @Published var toDate: Date = .now
    
    
    
    
    let logDataManager = LogDataManager()
    
    func filterLogsByDate() {
        filteredLogs = logDataManager.filterByDate(allLogs, fromDate: fromDate, toDate: toDate)
    }
    
    
    
}
