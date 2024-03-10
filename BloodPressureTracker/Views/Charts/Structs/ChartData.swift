//
//  ChartData.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 09/03/2024.
//

import Foundation

struct ChartData {
    var series: [ChartSeries]
    //    let dataPoints: [DataPoint]
}


extension ChartData {
    static let example = ChartData(series: [
        ChartSeries(dataPoints: DataPoint.examplesDiastolic),
        ChartSeries(dataPoints: DataPoint.examplesSystolic),
        ChartSeries(dataPoints: DataPoint.examplesPulse)
    ])
}



struct ChartSeries {
    let dataPoints: [DataPoint]
}

