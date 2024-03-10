//
//  LogDataSelectionType.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 10/03/2024.
//

import Foundation

enum LogDataSelectionType: String, Identifiable, CaseIterable {
    case all, systolic, diastolic, pulse
    var id: Self { self }
}
