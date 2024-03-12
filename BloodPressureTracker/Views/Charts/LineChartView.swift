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
    
    @Binding var fromDate: Date
    @Binding var toDate: Date
    
    var body: some View {
        ZStack {
            Chart() {
                
                switch dataTypeSelection {
                case .all:
                    ForEach(chartData.series.first(where: {$0.name == "systolic"})?.dataPoints ?? []) {
                        LineMark(
                            x: .value("Date", $0.date, unit: .hour),
                            y: .value("Value", $0.value),
                            series: .value("Systolic", "Systolic")
                        )
                    }
                    .foregroundStyle(settingsManager.chartLineColours.systolic)
                    .symbol(.circle)
                    
                    
                    ForEach(chartData.series.first(where: {$0.name == "diastolic"})?.dataPoints ?? []) {
                        LineMark(
                            x: .value("Date", $0.date, unit: .hour),
                            y: .value("Value", $0.value),
                            series: .value("Diastolic", "Diastolic")
                        )
                    }
                    .foregroundStyle(settingsManager.chartLineColours.diastolic)
                    .symbol(.triangle)
                    
                    ForEach(chartData.series.first(where: {$0.name == "pulse"})?.dataPoints ?? []) {
                        LineMark(
                            x: .value("Date", $0.date, unit: .hour),
                            y: .value("Value", $0.value),
                            series: .value("Pulse", "Pulse")
                        )
                    }
                    .foregroundStyle(settingsManager.chartLineColours.pulse)
                    .symbol(.cross)
                    
                    //                .foregroundStyle(by: .value("Data Type", LogDataType.allCases))
                    
                case .systolic:
                    ForEach(chartData.series.first(where: {$0.name == "systolic"})?.dataPoints ?? []) {
                        LineMark(
                            x: .value("Date", $0.date, unit: .hour),
                            y: .value("Value", $0.value),
                            series: .value("Diastolic", "Diastolic")
                        )
                    }
                    .foregroundStyle(settingsManager.chartLineColours.systolic)
                    .symbol(.circle)
                case .diastolic:
                    ForEach(chartData.series.first(where: {$0.name == "diastolic"})?.dataPoints ?? []) {
                        LineMark(
                            x: .value("Date", $0.date, unit: .hour),
                            y: .value("Value", $0.value),
                            series: .value("Systolic", "Systolic")
                        )
                    }
                    .foregroundStyle(settingsManager.chartLineColours.diastolic)
                    .symbol(.triangle)
                case .pulse:
                    ForEach(chartData.series.first(where: {$0.name == "pulse"})?.dataPoints ?? []) {
                        LineMark(
                            x: .value("Date", $0.date, unit: .hour),
                            y: .value("Value", $0.value),
                            series: .value("Pulse", "Pulse")
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
            
            .chartXScale(domain: fromDate...toDate)
            
            // Y Axis
            .chartYAxisLabel(dataTypeSelection == .pulse ? "BPM" : "mmHg")
            .chartYAxis {
                AxisMarks(position: .trailing)
            }
            
            
            // Line Graph Animations
            .transaction { transaction in
                //            transaction.animation = .spring()
                //                self.lineColour
                transaction.animation = nil
            }
            
            // Legend
            //        .chartLegend(position: .top) {
            //            HStack {
            //                Text("ddxxxxxxxxxx")
            //                Text("ddd")
            //            }
            //        }
            //        .chartLegend(.visible)
            
            
            VStack {
                Spacer()
                LineChartLegend(dataTypeSelection: $dataTypeSelection)
                    .offset(y: 20)
            }
            
        }
        .padding(.bottom, 20)
        

       
        
    }
}

//#Preview {
//    LineChartView(dataTypeSelection: .createBinding(.all), chartData: .example)
//        .environmentObject(SettingsManager())
//}
