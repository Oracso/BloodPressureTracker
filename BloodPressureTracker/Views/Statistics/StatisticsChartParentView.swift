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
    
    @StateObject var statCard = StatCard()
    
    @State private var chartData: ChartData = ChartData(series: [])
    
    let chartDataManager = ChartDataManager()
    
    func createChartData() {
        chartData = chartDataManager.createChartData(logStatsManager.filteredLogs, dataTypeSelection: logStatsManager.dataTypeSelection)
    }
    
        
    var body: some View {
        
        
        VStack {
            
            ChartDateFilterView(logStatsManager: logStatsManager)
            
            LineChartView(dataTypeSelection: $logStatsManager.dataTypeSelection, chartData: chartData)
                .frame(minHeight: 200)
            Picker("Data Tye Selection", selection: $logStatsManager.dataTypeSelection) {
                ForEach(LogDataSelectionType.allCases) { dataType in
                    Text(dataType.rawValue.capitalized)
                        .tag(dataType.rawValue)
                }
            }
                .pickerStyle(.segmented)
        }
        
        
        StatCardView(statCard: statCard)
        
        
        
        
            .onAppear() {
                createChartData()
            }
        
            .onAppear() {
                statCard.calculateStats(logStatsManager.filteredLogs)
            }
        
            .onChange(of: logStatsManager.filteredLogs) {
                createChartData()
                //
                statCard.calculateStats(logStatsManager.filteredLogs)
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
