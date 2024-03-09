//
//  StatisticsManager.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 08/02/2024.
//

import Foundation

class StatisticsManager: ObservableObject {
    
    let ldm = LogDataManager()
    let statCalculator = StatisticsCalculator()
    
    @Published var filteredLogs: [Log] = []
    
    
    
    // MARK: - Stat Properties
    
    @Published var systolicAverage: Double = 0
    @Published var diastolicAverage: Double = 0
    @Published var pulseAverage: Double = 0
    
    
    
    // MARK: - Filter Config
    
    @Published var timeFilter: Double = 12
    
}

extension StatisticsManager {
    func loadLogs(_ logs: [Log]) {
        filteredLogs = logs
    }
}



extension StatisticsManager {
    
    func calculateAverages() {
//        let filteredLogs: [Log]
//        
//        if filerByTime {
//            let time = DateComponents(hour: Int(timeFilter))
//            filteredLogs = ldm.filterByTime(self.filteredLogs, time: time)
//        } else {
//            filteredLogs = self.filteredLogs
//        }
        systolicAverage = statCalculator.averageReading(filteredLogs, dataType: .systolic)
        diastolicAverage = statCalculator.averageReading(filteredLogs, dataType: .diastolic)
        pulseAverage = statCalculator.averageReading(filteredLogs, dataType: .pulse)
    }
  
    
    
}
