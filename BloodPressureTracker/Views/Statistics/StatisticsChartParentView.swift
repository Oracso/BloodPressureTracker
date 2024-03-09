//
//  StatisticsChartParentView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 09/03/2024.
//

import SwiftUI

struct StatisticsChartParentView: View {
    
    @State private var dataTypeSelection: DataTypeSelection = .all
    
    
    enum DataTypeSelection: String, Identifiable, CaseIterable {
        case all, systolic, diastolic, pulse
        var id: Self { self }
    }
    
    var body: some View {
        
        
        VStack {
            LineChartView(chartData: .example)
            Picker("Data Tye Selection", selection: $dataTypeSelection) {
                ForEach(DataTypeSelection.allCases) { dataType in
                    Text(dataType.rawValue.capitalized)
                        .tag(dataType.rawValue)
                }
            }
                .pickerStyle(.segmented)
        }
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    NavigationStack {
        List {
            Section("Charts:") {
                StatisticsChartParentView()
            }
        }
    }
}
