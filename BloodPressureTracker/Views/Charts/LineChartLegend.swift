//
//  LineChartLegend.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 12/03/2024.
//

import SwiftUI

struct LineChartLegend: View {
    @EnvironmentObject var settingsManager: SettingsManager
    @Binding var dataTypeSelection: LogDataSelectionType
    var body: some View {
        HStack {
            switch dataTypeSelection {
            case .all:
                HStack {
                    Circle()
                        .fill(settingsManager.chartLineColours.systolic)
                        .frame(maxWidth: 10)
                    Text("Systolic")
                }
                HStack {
                    Circle()
                        .fill(settingsManager.chartLineColours.diastolic)
                        .frame(maxWidth: 10)
                    Text("Diastolic")
                }
                HStack {
                    Circle()
                        .fill(settingsManager.chartLineColours.pulse)
                        .frame(maxWidth: 10)
                    Text("Pulse")
                }
            case .systolic:
                HStack {
                    Circle()
                        .fill(settingsManager.chartLineColours.systolic)
                        .frame(maxWidth: 10)
                    Text("Systolic")
                }
            case .diastolic:
                HStack {
                    Circle()
                        .fill(settingsManager.chartLineColours.diastolic)
                        .frame(maxWidth: 10)
                    Text("Diastolic")
                }
            case .pulse:
                HStack {
                    Circle()
                        .fill(settingsManager.chartLineColours.pulse)
                        .frame(maxWidth: 10)
                    Text("Pulse")
                }
            }
            
            Spacer()
        }
        .foregroundStyle(.gray)
        .font(.system(size: 14))
        .padding(.leading, 20)
    }
}

#Preview {
    LineChartLegend(dataTypeSelection: .createBinding(.all))
        .environmentObject(SettingsManager())
}
