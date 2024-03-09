//
//  SettingsManager.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation

class SettingsManager: ObservableObject {
    
    init() {
        loadUserDefaults()
    }
    
    let defaults = UserDefaults.standard
    
    @Published var chartLineColours = ChartLineColours()
    
    
}

extension SettingsManager {
    func loadUserDefaults() {
        loadChartLineColours()
    }
}

extension SettingsManager {
    static func checkIfFirstLaunch() -> Bool {
        let defaults = UserDefaults.standard
        let ifFirstLaunch = defaults.value(forKey: "firstLaunch")
        if ifFirstLaunch != nil {
            return false
        } else {
            defaults.setValue(false, forKey: "firstLaunch")
            return true
        }
    }
}


