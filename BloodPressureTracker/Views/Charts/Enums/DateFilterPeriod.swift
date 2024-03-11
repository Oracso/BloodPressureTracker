//
//  DateFilterPeriod.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 11/03/2024.
//

import Foundation

enum DateFilterPeriod: String, Identifiable, CaseIterable {
    case week, month, quarter, year, custom
    var id: Self { self }
}
