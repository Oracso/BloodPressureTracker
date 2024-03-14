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
        filterLogsByDate()
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
        switch datePeriod {
        case .week:
            fromDate = .daysDif(-7)
            toDate = .now
            filter()
        case .month:
            fromDate = .daysDif(-28)
            toDate = .now
            filter()
        case .quarter:
            fromDate = .daysDif(-84)
            toDate = .now
            filter()
        case .year:
            fromDate = .yearsDif(-1)
            toDate = .now
            filter()
        case .custom:
            filter()
        }
    }
    
    private func filter() {
        if fromDate > toDate {
            fromDate = toDate
        } else {
            filteredLogs = logDataManager.filterByDate(allLogs, fromDate: fromDate, toDate: toDate)
        }
    }
    
    
}
