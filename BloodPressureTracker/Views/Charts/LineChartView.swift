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
                ForEach(chartData.series[0].dataPoints) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Diastolic", "A")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.systolic)
                .symbol(.circle)

                
                ForEach(chartData.series[1].dataPoints) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Systolic", "B")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.diastolic)
                .symbol(.triangle)
                
                ForEach(chartData.series[2].dataPoints) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Pulse", "C")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.pulse)
                .symbol(.cross)
            case .systolic:
                ForEach(chartData.series[0].dataPoints) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Diastolic", "A")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.systolic)
                .symbol(.circle)
            case .diastolic:
                ForEach(chartData.series[0].dataPoints) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Systolic", "B")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.diastolic)
                .symbol(.triangle)
            case .pulse:
                ForEach(chartData.series[0].dataPoints) {
                    LineMark(
                        x: .value("Date", $0.date, unit: .hour),
                        y: .value("Value", $0.value),
                        series: .value("Pulse", "C")
                    )
                }
                .foregroundStyle(settingsManager.chartLineColours.pulse)
                .symbol(.cross)
            }
            
            
//            .foregroundStyle(by: .value("Data Type", $0.dataType.rawValue))
            
//            .symbol(by: .value("value", $0.dataType.rawValue))
            
            
        }
        
        .padding(.horizontal, 20)
        
        // X Axis
        .chartXAxisLabel(alignment: .center) {
            Text("Date")
        }
        .chartYAxis {
            AxisMarks(position: .trailing)
//            AxisMarks(values: [0, 5, 10, 15])
        }
        
        // Y Axis
        .chartYAxisLabel("mmHg")
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
