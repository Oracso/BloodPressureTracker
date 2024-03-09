//
//  ChartColoursView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 07/02/2024.
//

import SwiftUI

struct ChartColoursView: View {
    @EnvironmentObject var settingsManager: SettingsManager
    var body: some View {
        List {
            
            ColorPicker("All", selection: $settingsManager.chartLineColours.all, supportsOpacity: false)
            ColorPicker("Systolic", selection: $settingsManager.chartLineColours.systolic, supportsOpacity: false)
            ColorPicker("Diastolic", selection: $settingsManager.chartLineColours.diastolic, supportsOpacity: false)
            ColorPicker("Pulse", selection: $settingsManager.chartLineColours.pulse, supportsOpacity: false)
            
            
            Button("Save Colours") {
                settingsManager.chartLineColours.saveColours()
            }
            
            Button("Reset Colours") {
                settingsManager.loadChartLineColours()
            }
            
            // TODO: Example Line Chart With Dumby Data
            
        }
        
        .navigationTitle("Chart Colours")
    }
}

#Preview {
    NavigationStack {
        ChartColoursView()
            .environmentObject(SettingsManager())
    }
}
