//
//  ChartDataManager.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 10/03/2024.
//

import Foundation

struct ChartDataManager {
    
    
//    func createChartData(_ logs: [Log], dataTypeSelection: LogDataSelectionType) -> ChartData {
//        var dataPoints: [DataPoint] = []
//        for log in logs {
//            switch dataTypeSelection {
//            case .all:
//                dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.systolicInt, dataType: .systolic))
//                dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.diastolicInt, dataType: .diastolic))
//                dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.pulseInt, dataType: .pulse))
//            case .systolic:
//                dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.systolicInt, dataType: .systolic))
//            case .diastolic:
//                dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.diastolicInt, dataType: .diastolic))
//            case .pulse:
//                dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.pulseInt, dataType: .pulse))
//            }
//        }
//        return ChartData(dataPoints: dataPoints)
//    }
    
//        func createChartData(_ logs: [Log], dataTypeSelection: LogDataSelectionType) -> ChartData {
//            var chartData = ChartData(series: [])
//            var dataPoints: [DataPoint] = []
//            for log in logs {
//                switch dataTypeSelection {
//                case .all:
//                    dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.systolicInt, dataType: .systolic))
//                    chartData.series.append(ChartSeries(dataPoints: dataPoints))
//                    dataPoints = []
//                    dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.diastolicInt, dataType: .diastolic))
//                    chartData.series.append(ChartSeries(dataPoints: dataPoints))
//                    dataPoints = []
//                    dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.pulseInt, dataType: .pulse))
//                    chartData.series.append(ChartSeries(dataPoints: dataPoints))
//                    dataPoints = []
//                case .systolic:
//                    dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.systolicInt, dataType: .systolic))
//                case .diastolic:
//                    dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.diastolicInt, dataType: .diastolic))
//                    chartData.series.append(ChartSeries(dataPoints: dataPoints))
//                case .pulse:
//                    dataPoints.append(DataPoint(date: log.unwrappedDate, value: log.pulseInt, dataType: .pulse))
//                    chartData.series.append(ChartSeries(dataPoints: dataPoints))
//                }
//            }
//            return chartData
//            
//            
//            
//            
////            switch dataTypeSelection {
////            case .all:
////                <#code#>
////            case .systolic:
////                <#code#>
////            case .diastolic:
////                <#code#>
////            case .pulse:
////                <#code#>
////            }
//            
//            
//        }
    
    
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
    
    
}




extension ChartDataManager {
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
