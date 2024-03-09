//
//  TabBarView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var ads: AppDataStore
    
    var body: some View {
        TabView {
            AllXView(ads.allObjects(.log), .log)
                .tabItem {
                    Label("Logs", systemImage: "bookmark")
                }
            
            StatisticsView()
                .tabItem {
                    Label("Statistics", systemImage: "book")
                }
            
             
        }
        
    }
}

#Preview {
    TabBarView()
        .environmentObject(AppDataStore(CoreDataManager.preview.container.viewContext))
}
