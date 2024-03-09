//
//  ArmType.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation

enum ArmType: String, CaseIterable, Identifiable {
    case left, right
    var id: Self { self }
}
