//
//  LogDataManager.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation

struct LogDataManager {
    
    // MARK: - Date
    
    func filterByDate(_ logs: [Log], fromDate: Date, toDate: Date) -> [Log] {
        let thingsBeforeRemoved = logs.filter( {$0.date ?? .daysDif(-7) > fromDate })
        let filterLogs = thingsBeforeRemoved.filter( {$0.date ?? .now < toDate })
        return filterLogs
    }
    
    func filterByTime(_ logs: [Log], time: DateComponents) -> [Log] {
        var array: [Log] = []
        for log in logs {
            
            let logHourComponent = Calendar.current.dateComponents([.hour], from: log.date!)
            let logHourInt = logHourComponent.hour!
            
            let timeHourFilter = time.hour!
            
            if logHourInt == timeHourFilter {
                array.append(log)
            }
            
        }
        
        return array
    }

    // MARK: - Arm
    

    func filterByArm(_ logs: [Log], _ arm: ArmType) -> [Log] {
        var array: [Log] = []
        for log in logs {
            switch arm {
            case .left:
                array.append(log)
            case .right:
                array.append(log)
            }
        }
        return array
    }


   

    // MARK: - Considerations
    
    func filterLogsWithConfounders(_ logs: [Log]) -> [Log] {
        var array: [Log] = []
        for log in logs {
//            if !log.considerations.isEmpty {
//                array.append(log)
//            }
        }
        return array
    }
    
    func returnAllConfounderKeys(_ logs: [Log]) -> [String] {
        var array: [String] = []
        for log in logs {
//            for consideration in log.considerations {
//                if !array.contains(consideration.key) {
//                    array.append(consideration.key)
//                }
//            }
        }
        return array
    }
    
    
    func returnLogsWithConfounders(_ logs: [Log], consideration: String) -> [Log] {
        var array: [Log] = []
        for log in logs {
//            if log.considerations.contains(where: {$0.key.lowercased() == consideration.lowercased()}) {
//                array.append(log)
//            }
        }
        return array
    }
    
    
    
    func returnForEach(_ logs: [Log]) -> [String: [Log]] {
        var array: [String: [Log]] = [:]
        let keys = returnAllConfounderKeys(logs)
        for key in keys {
            let filtered = returnLogsWithConfounders(logs, consideration: key)
            array[key] = filtered
        }
        return array
    }
    
    
    
    
    
    
    
    // MARK: - Notes

    func filterByNotes(_ logs: [Log]) -> [Log] {
        var array: [Log] = []
        for log in logs {
            if log.notes != nil {
                array.append(log)
            }
        }
        return array
    }
    
    
    
    
    // MARK: - Other
    
    
    func returnFirstAndLast(_ logs: [Log]) -> (Date, Date) {
        
        if !logs.isEmpty {
            
            let sorted = logs.sorted(by: {$0.date ?? .now < $1.date ?? .now})
            print("Run")
            let fromDate = sorted.first?.date
            let toDate = sorted.last?.date
            
            return (fromDate!, toDate!)
            
        }
        
        return (Date.daysDif(-7), Date.now)
    }
    
    
    
    
    func returnLogsInTimeRange(_ allLogs: [Log], timeRange: ClosedRange<Date>) -> [Log] {
        
        var finalArray: [Log] = []
        
        for log in allLogs {
            if timeRange.contains(log.date ?? .now) {
                finalArray.append(log)
            }
            
        }
        
        return finalArray
    }
    
    
    
}
