//
//  LogDataType.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation

enum LogDataType: String, Identifiable, CaseIterable {
    case systolic, diastolic, pulse
    var id: Self { self }
}
