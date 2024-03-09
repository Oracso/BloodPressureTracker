//
//  DifferenceRecord.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 08/02/2024.
//

import Foundation

struct DifferenceRecord: Hashable {
    let fromDate: Date
    let toDate: Date
    let difference: Int
}
