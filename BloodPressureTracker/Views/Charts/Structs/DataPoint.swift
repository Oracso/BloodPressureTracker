//
//  DataPoint.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 09/03/2024.
//

import Foundation

struct DataPoint: Identifiable, Hashable {
    let date: Date
    let value: Int
    var id: Date { date }
}


extension DataPoint {
    static let examplesDiastolic = [
        DataPoint(date: .now, value: 0),
        DataPoint(date: .daysDif(-1), value: 1),
        DataPoint(date: .daysDif(-2), value: 2),
        DataPoint(date: .daysDif(-3), value: 3),
        DataPoint(date: .daysDif(-4), value: 4)
    ]
}

extension DataPoint {
    static let examplesSystolic = [
        DataPoint(date: .now, value: 10),
        DataPoint(date: .daysDif(-1), value: 11),
        DataPoint(date: .daysDif(-2), value: 12),
        DataPoint(date: .daysDif(-3), value: 13),
        DataPoint(date: .daysDif(-4), value: 14)
    ]
}

extension DataPoint {
    static let examplesPulse = [
        DataPoint(date: .now, value: 5),
        DataPoint(date: .daysDif(-1), value: 6),
        DataPoint(date: .daysDif(-2), value: 7),
        DataPoint(date: .daysDif(-3), value: 8),
        DataPoint(date: .daysDif(-4), value: 9)
    ]
}

