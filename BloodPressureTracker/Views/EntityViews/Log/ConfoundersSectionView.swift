//
//  ConfoundersSectionView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import SwiftUI

struct ConfoundersSectionView: View {
    @Binding var confounders: String?
    @Binding var confoundersDic: [String: String]
    @State private var showSheet: Bool = false
    var body: some View {
        
        Section {
            ForEach(confoundersDic.sorted(by: <), id: \.key) { confounder, description in
                DisclosureGroup(confounder.capitalized) {
                    Text(description)
                }
                
                .swipeActions(edge: .trailing) {
                    Button(role: .destructive) {
                        confoundersDic.removeValue(forKey: confounder)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
                
                
            }
            
            
        } header: {
            HStack {
                Text("Confounders:")
                Spacer()
                Button("+") {
                    showSheet = true
                }
                .font(.system(size: 20))
                
            }
        }
        
        .sheet(isPresented: $showSheet, content: {
            ConfounderSheet(confoundersDic: $confoundersDic, showSheet: $showSheet)
        })
        
        
        
        
        
        
        
    }
}

#Preview {
    NavigationStack {
        List {
            ConfoundersSectionView(confounders: .createBinding(JSONManager.dictionaryToJsonString(dic)), confoundersDic: .createBinding([:]))
        }
    }
}




