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
        ChartSeries(name: "diastolic", dataPoints: DataPoint.examplesDiastolic),
        ChartSeries(name: "systolic", dataPoints: DataPoint.examplesSystolic),
        ChartSeries(name: "pulse", dataPoints: DataPoint.examplesPulse)
    ])
}



struct ChartSeries {
    let name: String
    let dataPoints: [DataPoint]
}

