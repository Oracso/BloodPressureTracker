//
//  SettingsView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import SwiftUI

struct SettingsView: View {
    
    var body: some View {
        
        List {
            
            NavigationLink("Chart Colours") {
                ChartColoursView()
            }
            
            NavigationLink("Download Data") {
                DataDownloadView()
            }
            
            
        }
        
        .navigationTitle("Settings")
      
        
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
