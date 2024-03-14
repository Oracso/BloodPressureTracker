//
//  StatCardView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 11/03/2024.
//

import SwiftUI

struct StatCardView: View {
    @ObservedObject var statCard: StatCard
    var body: some View {
        
        Section("Average:") {
            HStack {
                Spacer()
                BloodPressureReadingView(systolic: statCard.averageSystolic, diastolic: statCard.averageDiastolic, pulse: statCard.averagePulse)
                Spacer()
            }
        }
        
        Section("Systolic:") {
            Text("Lowest: \(statCard.lowestSystolic)")
            Text("Highest: \(statCard.highestSystolic)")
        }
        
        Section("Diastolic:") {
            Text("Lowest: \(statCard.lowestDiastolic)")
            Text("Highest: \(statCard.highestDiastolic)")
        }
        
        Section("Pulse:") {
            Text("Lowest: \(statCard.lowestDiastolic)")
            Text("Highest: \(statCard.highestDiastolic)")
        }
        
        
        
    }
}

#Preview {
    NavigationStack {
        List {
            StatCardView(statCard: StatCard())
        }
    }
}
