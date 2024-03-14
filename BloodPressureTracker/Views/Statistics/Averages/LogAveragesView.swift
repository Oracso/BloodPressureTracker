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
    
    @State private var toggleView: Bool = true
    
    var body: some View {
        
        VStack {
            
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    HStack {
                        if toggleView {
                            Spacer()
                            AveragesComponentView(average: $statsManager.systolicAverage, logDataType: .systolic)
                            Spacer()
                            AveragesComponentView(average: $statsManager.diastolicAverage, logDataType: .diastolic)
                            Spacer()
                            AveragesComponentView(average: $statsManager.pulseAverage, logDataType: .pulse)
                            Spacer()
                        } else {
                            BloodPressureReadingView(systolic: statsManager.systolicAverage, diastolic: statsManager.diastolicAverage, pulse: statsManager.pulseAverage)
                                .scaleEffect(1.5)
                                .frame(minHeight: 110)
                        }
                        
                    }
                    HStack {
                        Spacer()
                        Text("Filter By Time")
                        Toggle("Filter By Time", isOn: $filterByTime)
                            .labelsHidden()
                        Spacer()
                    }
                }
                
                Image(systemName: toggleView ? "heart.circle" : "heart.circle.fill")
                    .scaleEffect(1.5)
                    .foregroundStyle(toggleView ? .red : .green)
                    .onTapGesture {
                        toggleView.toggle()
                    }
                
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
                .environmentObject(AppDataStore(CoreDataPreviewManager.previewManager.context))
                .environmentObject(StatisticsManager())
        }
    }
}
