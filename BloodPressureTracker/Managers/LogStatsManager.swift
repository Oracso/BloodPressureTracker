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
    
    
    
    
    
}
