//
//  StatisticsChartParentView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 09/03/2024.
//

import SwiftUI

struct StatisticsChartParentView: View {
    
    init(allLogs: [Log]) {
        _logStatsManager = StateObject(wrappedValue: LogStatsManager(allLogs: allLogs))
    }
    
    @StateObject var logStatsManager: LogStatsManager
    
    @State private var chartData: ChartData = ChartData(series: [])
    
    let chartDataManager = ChartDataManager()
    
    func createChartData() {
        chartData = chartDataManager.createChartData(logStatsManager.filteredLogs, dataTypeSelection: logStatsManager.dataTypeSelection)
    }
    
    var body: some View {
        
        
        VStack {
            LineChartView(dataTypeSelection: $logStatsManager.dataTypeSelection, chartData: chartData)
            Picker("Data Tye Selection", selection: $logStatsManager.dataTypeSelection) {
                ForEach(LogDataSelectionType.allCases) { dataType in
                    Text(dataType.rawValue.capitalized)
                        .tag(dataType.rawValue)
                }
            }
                .pickerStyle(.segmented)
        }
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
        
        
            .onAppear() {
                createChartData()
            }
        
            .onChange(of: logStatsManager.filteredLogs) {
                createChartData()
            }
        
            .onChange(of: logStatsManager.dataTypeSelection) {
                createChartData()
            }
        
        
    }
}

#Preview {
    NavigationStack {
        List {
            Section("Charts:") {
                StatisticsChartParentView(allLogs: AppDataStore(CoreDataPreviewManager.previewManager.context).objects.logOS.logs)
                    .environmentObject(SettingsManager())
            }
        }
    }
}
