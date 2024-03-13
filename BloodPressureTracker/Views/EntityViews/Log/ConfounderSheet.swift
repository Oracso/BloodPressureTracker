//
//  ConfounderSheet.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 13/03/2024.
//

import SwiftUI

struct ConfounderSheet: View {
    @Binding var confoundersDic: [String: String]
    @Binding var showSheet: Bool
    
    @State private var confounder: String = ""
    @State private var comments: String = ""
    
    func addConfounder() {
        confoundersDic[confounder] = comments
    }
    
    var body: some View {
        List {
            
            Section("Confounder") {
                TextField("", text: $confounder)
            }
            
            Section("Comments") {
                TextField("", text: $comments)
            }
            
            
            Button("Save") {
                addConfounder()
                showSheet = false
            }
            
            Button("Cancel") {
                showSheet = false
            }
            
            
//            .toolbar {
//                ToolbarItem {
//                    Text("Ffff")
//                }
//            }
            
        }
        
        
        
        
    }
}

#Preview {
    NavigationStack {
        List {
            ConfoundersParentView(log: CoreDataPreviewManager.previewManager.fetcher.fetchObject(.log)?.castedAsLog() ?? Log())
                .sheet(isPresented: .createBinding(true), content: {
                    ConfounderSheet(confoundersDic: .createBinding([:]), showSheet: .createBinding(true))
                })
        }
    }
}
