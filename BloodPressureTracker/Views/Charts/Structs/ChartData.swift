//
//  ChartData.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 09/03/2024.
//

import Foundation

struct ChartData {
    let dataPoints: [DataPoint]
}


extension ChartData {
    static let example = ChartData(dataPoints: [
        DataPoint(date: .now, value: 0, dataType: .diastolic),
        DataPoint(date: .daysDif(1), value: 1, dataType: .diastolic),
        DataPoint(date: .daysDif(2), value: 2, dataType: .diastolic),
        DataPoint(date: .daysDif(3), value: 3, dataType: .diastolic),
        DataPoint(date: .daysDif(4), value: 4, dataType: .diastolic),
        DataPoint(date: .now, value: 10, dataType: .systolic),
        DataPoint(date: .daysDif(1), value: 11, dataType: .systolic),
        DataPoint(date: .daysDif(2), value: 12, dataType: .systolic),
        DataPoint(date: .daysDif(3), value: 13, dataType: .systolic),
        DataPoint(date: .daysDif(4), value: 14, dataType: .systolic),
        DataPoint(date: .now, value: 5, dataType: .pulse),
        DataPoint(date: .daysDif(1), value: 6, dataType: .pulse),
        DataPoint(date: .daysDif(2), value: 7, dataType: .pulse),
        DataPoint(date: .daysDif(3), value: 8, dataType: .pulse),
        DataPoint(date: .daysDif(4), value: 9, dataType: .pulse)
    ])
}
