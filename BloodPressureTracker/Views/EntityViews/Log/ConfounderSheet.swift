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
    
    @FocusState var keyboardActive: Bool
    
    var body: some View {
        
        NavigationStack {
        
        List {
            
            Section("Confounder") {
                TextField("", text: $confounder)
                    .focused($keyboardActive)
            }
            
            Section("Comments") {
                TextField("", text: $comments)
                    .focused($keyboardActive)
            }
            
            
                        
            
        }
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    showSheet = false
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    addConfounder()
                    showSheet = false
                }
            }
            
        }
        
        .navigationTitle("Add Confounder")
        
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
                .environmentObject(ViewEditingManager(CoreDataManager.preview.container.viewContext))
        }
    }
}
