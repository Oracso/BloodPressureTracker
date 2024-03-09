//
//  LineChartView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 09/03/2024.
//

import SwiftUI
import Charts

struct LineChartView: View {
    
    let chartData: ChartData
    
    var body: some View {
        Chart(chartData.dataPoints) {
            LineMark(
                x: .value("Date", $0.date, unit: .hour),
                y: .value("Value", $0.value)
            )
            .foregroundStyle(by: .value("Data Type", $0.dataType.rawValue))
            
            .symbol(by: .value("value", $0.dataType.rawValue))
            
//            .foregroundStyle(setLineColour(chartData))
            
//            .foregroundStyle(by: .value("Data Type", $0.dataType.rawValue))
            
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
    LineChartView(chartData: .example)
}
