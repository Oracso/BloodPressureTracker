//
//  ConfoundersParentView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 13/03/2024.
//

import SwiftUI

struct ConfoundersParentView: View {
    @ObservedObject var log: Log
    
    @State private var confoundersDic: [String: String] = [:]
    
    @State private var showSheet: Bool = false
    
    var addLogView: Bool = false
    
    var body: some View {
        
        ConfoundersSectionView(confounders: $log.confounders, confoundersDic: $confoundersDic, addLogView: addLogView)
        
        
            .onAppear() {
                if let string = log.confounders {
                    confoundersDic = JSONManager.jsonStringToDictionary(string, String.self, String.self)
                }
            }
        
        
            .onChange(of: confoundersDic) {
                log.confounders = JSONManager.dictionaryToJsonString(confoundersDic)
            }
        
        
    }
}

#Preview {
    NavigationStack {
        List {
            ConfoundersParentView(log: CoreDataPreviewManager.previewManager.fetcher.fetchObject(.log)?.castedAsLog() ?? Log())
        }
    }
}

let dic = ["exercise" : "worked out 30 mins ago", "sleep": "only had 4 hours sleep"]
