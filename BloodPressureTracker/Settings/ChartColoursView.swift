//
//  ChartColoursView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 07/02/2024.
//

import SwiftUI

struct ChartColoursView: View {
    @EnvironmentObject var settingsManager: SettingsManager
    @State private var showButtons: Bool = false
    @State private var reset: Bool = false
    var body: some View {
        List {
            
            Section("Colours") {
                ColorPicker("Systolic", selection: $settingsManager.chartLineColours.systolic, supportsOpacity: false)
                ColorPicker("Diastolic", selection: $settingsManager.chartLineColours.diastolic, supportsOpacity: false)
                ColorPicker("Pulse", selection: $settingsManager.chartLineColours.pulse, supportsOpacity: false)
            }
            
            Section("Preview") {
                LineChartView(dataTypeSelection: .createBinding(.all), chartData: .example, fromDate: .createBinding(.daysDif(-4)), toDate: .createBinding(.now))
            }
            
            
            
            if showButtons {
                Section {
                    Button("Save Colours") {
                        showButtons = false
                        settingsManager.chartLineColours.saveColours()
                    }
                }
                
                
                Button("Reset Colours") {
                    settingsManager.loadChartLineColours()
                    reset = true
                }
            }
            
            
            
        }
        
        .navigationTitle("Chart Colours")
        
        
        .onChange(of: settingsManager.chartLineColours.systolic) {
            showButtons = true
        }
        
        .onChange(of: settingsManager.chartLineColours.diastolic) {
            showButtons = true
        }
        
        .onChange(of: settingsManager.chartLineColours.pulse) {
            showButtons = true
        }
        
        .onChange(of: reset) {
            reset = false
            showButtons = false
        }
        
        
    }
}

#Preview {
    NavigationStack {
        ChartColoursView()
            .environmentObject(SettingsManager())
    }
}
