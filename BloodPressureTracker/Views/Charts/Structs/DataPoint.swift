//
//  DataPoint.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 09/03/2024.
//

import Foundation

struct DataPoint: Identifiable {
    let date: Date
    let value: Int
    let dataType: LogDataType
    var id: Date { date }
}
