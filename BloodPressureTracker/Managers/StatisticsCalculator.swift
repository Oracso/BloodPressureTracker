//
//  StatisticsCalculator.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 08/02/2024.
//

import Foundation

struct StatisticsCalculator {
    
    
    // load logs into it to remove need to input into function
//    let allLogs: [TestLog]
    
    private func returnValueArray(_ allLogs: [Log], dataType: LogDataType) -> [Int] {
        var array: [Int] = []
        for log in allLogs {
            switch dataType {
            case .systolic:
                array.append(log.systolicInt)
            case .diastolic:
                array.append(log.diastolicInt)
            case .pulse:
                array.append(log.pulseInt)
            }
        }
        return array
    }
    
    func averageReading(_ logs: [Log], dataType: LogDataType) -> Double {
        let array = returnValueArray(logs, dataType: dataType)
        let sum = array.reduce(0, +)
        if sum == 0 {
            return 0
        } else {
            return Double(sum) / Double(array.count)
        }
    }
    
//    func averageSystolic(_ allLogs: [Log]) -> Double {
//        let array = returnValueArray(allLogs, dataType: .systolic)
//        let sum = array.reduce(0, +)
//        if sum == 0 {
//            return 0
//        } else {
//            return Double(sum) / Double(array.count)
//        }
//    }
//    
//    func averageDiastolic(_ allLogs: [Log]) -> Double {
//        let array = returnValueArray(allLogs, dataType: .diastolic)
//        let sum = array.reduce(0, +)
//        if sum == 0 {
//            return 0
//        } else {
//            return Double(sum) / Double(array.count)
//        }
//    }
//    
//    func averagePulse(_ allLogs: [Log]) -> Double {
//        let array = returnValueArray(allLogs, dataType: .pulse)
//        let sum = array.reduce(0, +)
//        if sum == 0 {
//            return 0
//        } else {
//            return Double(sum) / Double(array.count)
//        }
//    }
    
    func totalEntries(_ allLogs: [Log]) -> Int {
        return allLogs.count
    }
    
    func totalLeft(_ allLogs: [Log]) -> Int {
        var count = 0
        for log in allLogs {
            if log.arm == "left" {
                count += 1
            }
        }
        return count
    }
    
    func totalRight(_ allLogs: [Log]) -> Int {
        var count = 0
        for log in allLogs {
            if log.arm == "right" {
                count += 1
            }
        }
        return count
    }
    
    func lowestHighestValue(_ allLogs: [Log], dataType: LogDataType) -> (lowest: Int, highest: Int) {
        let array = returnValueArray(allLogs, dataType: dataType)
        let min = array.min() ?? 0
        let max = array.max() ?? 0
        return (lowest: min, highest: max)
    }
    
    
    
    func biggestChange(_ allLogs: [Log], dataType: LogDataType) -> [DifferenceRecord] {
        // can change this to array if ===
        var differences: [DifferenceRecord] = []
        
        // is there a better way to make range
        for i in 0...allLogs.count - 1 {
            var diff = 0
            switch dataType {
            case .systolic:
                diff = allLogs[i].systolicInt - allLogs[i + 1].systolicInt
            case .diastolic:
                diff = allLogs[i].systolicInt - allLogs[i + 1].systolicInt
            case .pulse:
                diff = allLogs[i].systolicInt - allLogs[i + 1].systolicInt
            }
            // TODO: These are all the same.. should they be?
            
            if diff < 0 {
                diff = diff * -1
            }
            
            for difference in differences {
                if diff > difference.difference {
                    let newDifference = DifferenceRecord(fromDate: allLogs[i].date ?? .now, toDate: allLogs[i+1].date ?? .now, difference: diff)
                    differences.append(newDifference)
                }
            }
            
            
        }
        return differences
    }
    
    
    
    
//    func checkIfZero(sum: Double) -> Double {
//        if sum == 0 {
//            return 0
//        }
//    }
    
    
    
}
