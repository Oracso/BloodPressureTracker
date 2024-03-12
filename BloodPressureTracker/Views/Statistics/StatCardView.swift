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
        
        HStack {
            Spacer()
            Text("Average:")
            BloodPressureReadingView(systolic: statCard.averageSystolic, diastolic: statCard.averageDiastolic, pulse: statCard.averagePulse)
            Spacer()
        }
        
        HStack {
            Spacer()
            VStack {
                Text("Systolic")
                HStack {
                    Text("Lowest: \(statCard.lowestSystolic)")
                    Text("Highest: \(statCard.highestSystolic)")
                }
            }
            Spacer()
        }
        
        HStack {
            Spacer()
            VStack {
                Text("Diastolic")
                HStack {
                    Text("Lowest: \(statCard.lowestDiastolic)")
                    Text("Highest: \(statCard.highestDiastolic)")
                }
            }
            Spacer()
        }
        
        HStack {
            Spacer()
            VStack {
                Text("Pulse")
                HStack {
                    Text("Lowest: \(statCard.lowestDiastolic)")
                    Text("Highest: \(statCard.highestDiastolic)")
                }
            }
            Spacer()
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
