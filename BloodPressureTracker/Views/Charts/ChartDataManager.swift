//
//  ChartDataManager.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 10/03/2024.
//

import Foundation

struct ChartDataManager {
    
    func createChartData(_ logs: [Log], dataTypeSelection: LogDataSelectionType) -> ChartData {
        switch dataTypeSelection {
        case .all:
            return ChartData(series: [createChartSeries(logs, .systolic), createChartSeries(logs, .diastolic), createChartSeries(logs, .pulse)])
        case .systolic:
            return ChartData(series: [createChartSeries(logs, .systolic)])
        case .diastolic:
            return ChartData(series: [createChartSeries(logs, .diastolic)])
        case .pulse:
            return ChartData(series: [createChartSeries(logs, .pulse)])
        }
    }
    
    
    func createChartSeries(_ logs: [Log], _ dataType: LogDataType) -> ChartSeries {
        var dataPoints: [DataPoint] = []
        for log in logs {
            switch dataType {
            case .systolic:
                dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.systolicInt))
            case .diastolic:
                dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.diastolicInt))
            case .pulse:
                dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.pulseInt))
            }
        }
        return ChartSeries(name: dataType.rawValue, dataPoints: dataPoints)
    }
    
    
    
}

