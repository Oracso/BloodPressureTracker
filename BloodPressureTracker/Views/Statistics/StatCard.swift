//
//  StatCard.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 11/03/2024.
//

import Foundation

class StatCard: ObservableObject {
    
    let statCalculator = StatisticsCalculator()
    
    @Published var lowestSystolic: Int = 0
    @Published var highestSystolic: Int = 0
    @Published var averageSystolic: Double = 0

    @Published var lowestDiastolic: Int = 0
    @Published var highestDiastolic: Int = 0
    @Published var averageDiastolic: Double = 0
    
    @Published var lowestPulse: Int = 0
    @Published var highestPulse: Int = 0
    @Published var averagePulse: Double = 0
    
    @Published var totalRight: Int = 0
    @Published var totalLeft: Int = 0
    
}


extension StatCard {
    func calculateStats(_ logs: [Log]) {
        averages(logs)
        highestLowest(logs)
    }
    
    func averages(_ logs: [Log]) {
        averageSystolic = statCalculator.averageReading(logs, dataType: .systolic)
        averageDiastolic = statCalculator.averageReading(logs, dataType: .diastolic)
        averagePulse = statCalculator.averageReading(logs, dataType: .pulse)
    }
    
    func highestLowest(_ logs: [Log]) {
        let sys = statCalculator.lowestHighestValue(logs, dataType: .systolic)
        highestSystolic = sys.highest
        lowestSystolic = sys.lowest
        
        let dia = statCalculator.lowestHighestValue(logs, dataType: .diastolic)
        highestDiastolic = dia.highest
        lowestDiastolic = dia.lowest
        
        let pul = statCalculator.lowestHighestValue(logs, dataType: .pulse)
        highestPulse = pul.highest
        lowestPulse = pul.lowest
    }
    
}
