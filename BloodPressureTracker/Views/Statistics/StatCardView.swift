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
        
        Text("Average Systolic: \(String(format: "%.2f", statCard.averageSystolic))")
        Text("Average Diastolic: \(String(format: "%.2f", statCard.averageDiastolic))")
        Text("Average Pulse: \(String(format: "%.2f", statCard.averagePulse))")
        
        VStack {
            Text("Systolic")
            HStack {
                Text("Lowest: \(statCard.lowestSystolic)")
                Text("Highest: \(statCard.highestSystolic)")
            }
        }
        
        VStack {
            Text("Diastolic")
            HStack {
                Text("Lowest: \(statCard.lowestDiastolic)")
                Text("Highest: \(statCard.highestDiastolic)")
            }
        }
        
        VStack {
            Text("Pulse")
            HStack {
                Text("Lowest: \(statCard.lowestDiastolic)")
                Text("Highest: \(statCard.highestDiastolic)")
            }
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
