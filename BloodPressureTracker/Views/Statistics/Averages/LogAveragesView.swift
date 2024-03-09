//
//  LogAveragesView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 08/02/2024.
//

import SwiftUI

struct LogAveragesView: View {
    @EnvironmentObject var ads: AppDataStore
    @EnvironmentObject var statsManager: StatisticsManager
    
    @State private var filterByTime = false
    
    func calculateAverages() {
        let logs = ads.objects.logOS.logs
        if filterByTime {
            let time = DateComponents(hour: Int(statsManager.timeFilter))
            statsManager.filteredLogs = statsManager.ldm.filterByTime(logs, time: time)
        } else {
            statsManager.filteredLogs = logs
        }
        statsManager.calculateAverages()
    }
    
    var body: some View {
        
        
        VStack {
            
            
            HStack {
                Spacer()
                AveragesComponentView(average: $statsManager.systolicAverage, logDataType: .systolic)
                Spacer()
                AveragesComponentView(average: $statsManager.diastolicAverage, logDataType: .diastolic)
                Spacer()
                AveragesComponentView(average: $statsManager.pulseAverage, logDataType: .pulse)
                Spacer()
            }
            HStack {
                Spacer()
                Text("Filter By Time")
                Toggle("Filter By Time", isOn: $filterByTime)
                    .labelsHidden()
                Spacer()
            }
            
            if filterByTime {
                Text("\(statsManager.timeFilter.roundToIntOrDouble()):00")
                Slider(value: $statsManager.timeFilter, in: 1...24, step: 1)
            }
            
            
            
        }
        
        .onChange(of: statsManager.timeFilter) {
            calculateAverages()
        }
        
        .onChange(of: filterByTime) {
            calculateAverages()
        }
        
        
        .onAppear() {
            calculateAverages()
        }
        
    }
}

#Preview {
    NavigationStack {
        List {
            LogAveragesView()
                .environmentObject(StatisticsManager())
        }
    }
}
