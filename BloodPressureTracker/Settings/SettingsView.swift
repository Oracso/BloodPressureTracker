//
//  SettingsView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import SwiftUI

struct SettingsView: View {
    
//    @EnvironmentObject var settingsManager: SettingsManager
    
    var body: some View {
        
        List {
            
            NavigationLink("Download Data") {
                DataDownloadView()
            }
            
            NavigationLink("Chart Colours") {
                ChartColoursView()
            }
            
            
        }
        
        .navigationTitle("Settings")
      
//        .environmentObject(settingsManager)
        
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
