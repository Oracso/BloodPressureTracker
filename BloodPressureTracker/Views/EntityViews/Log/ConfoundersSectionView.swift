//
//  ConfoundersSectionView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import SwiftUI

struct ConfoundersSectionView: View {
    @Binding var confoundersString: String?
    @State private var confoundersDic: [String: String] = [:]
    var body: some View {
        if let confoundersString {
            Section {
                ForEach(confoundersDic.sorted(by: >), id: \.key) { confounder, description in
                    DisclosureGroup(confounder.capitalized) {
                        Text(description)
                    }
                    
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
//                            confoundersDic[c]
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                    
                    
                }
                
                
            } header: {
                HStack {
                    Text("Confounding Variables:")
                    Spacer()
                    
                    Button("Edit") {
                        
                    }
                    .font(.system(size: 14))
                }
            }
            
            .onAppear() {
                confoundersDic = JSONManager.jsonStringToDictionary(confoundersString, String.self, String.self)
            }
            
            
        }
        
            
        
    }
}

#Preview {
    NavigationStack {
        List {
            ConfoundersSectionView(confoundersString: .createBinding(JSONManager.dictionaryToJsonString(dic)))
        }
    }
}

let dic = ["exercise" : "worked out 30 mins ago", "sleep": "only had 4 hours sleep"]


