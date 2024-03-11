//
//  LineChartView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 09/03/2024.
//

import SwiftUI
import Charts

struct LineChartView: View {
    
    @EnvironmentObject var settingsManager: SettingsManager
    
    @Binding var dataTypeSelection: LogDataSelectionType
    
    let chartData: ChartData
    
    var body: some View {
        Chart() {
           
            switch dataTypeSelection {
            case .all:
                ForEach(chartData.series.first(where: {$0.name == "systolic"})?.dataPoints ?? []) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Systolic", "A")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.systolic)
                .symbol(.circle)

                
                ForEach(chartData.series.first(where: {$0.name == "diastolic"})?.dataPoints ?? []) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Diastolic", "B")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.diastolic)
                .symbol(.triangle)
                
                ForEach(chartData.series.first(where: {$0.name == "pulse"})?.dataPoints ?? []) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Pulse", "C")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.pulse)
                .symbol(.cross)
            case .systolic:
                ForEach(chartData.series.first(where: {$0.name == "systolic"})?.dataPoints ?? []) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Diastolic", "A")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.systolic)
                .symbol(.circle)
            case .diastolic:
                ForEach(chartData.series.first(where: {$0.name == "diastolic"})?.dataPoints ?? []) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Systolic", "B")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.diastolic)
                .symbol(.triangle)
            case .pulse:
                ForEach(chartData.series.first(where: {$0.name == "pulse"})?.dataPoints ?? []) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Pulse", "C")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.pulse)
                .symbol(.cross)
            }
            
            
        }
        
        .padding(.horizontal, 20)
        
        // X Axis
        .chartXAxisLabel(alignment: .center) {
            Text("Date")
        }
        
//        .chartXAxis {
//            AxisMarks(preset: .aligned)
//        }
//        .chartXScale(domain: 0...60)
        
        .chartYAxis {
            AxisMarks(position: .trailing)
//            AxisMarks(values: [0, 5, 10, 15])
        }
        
        // Y Axis
        .chartYAxisLabel(dataTypeSelection == .pulse ? "BPM" : "mmHg")
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        
        
        // Line Graph Animations
        .transaction { transaction in
//            transaction.animation = .spring()
//                self.lineColour
            transaction.animation = nil
        }
        
        
    }
}

#Preview {
    LineChartView(dataTypeSelection: .createBinding(.all), chartData: .example)
        .environmentObject(SettingsManager())
}
