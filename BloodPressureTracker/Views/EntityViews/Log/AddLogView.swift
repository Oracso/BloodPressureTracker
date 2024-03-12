//
//  AddLogView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import SwiftUI

struct AddLogView: View {
    
    init(_ log: Log) {
        self.log = log
    }
    
    @ObservedObject var log: Log
    
    @EnvironmentObject var vem: ViewEditingManager
    
    var body: some View {
        
        List {
            
            Section("Systolic:") {
                LabeledContent("Systolic:") {
                    TextField("Systolic", text: $log.systolic.toStringBinding())
                        .keyboardType(.numberPad)
                }
            }
            
            Section("Diastolic:") {
                LabeledContent("Diastolic:") {
                    TextField("Diastolic", text: $log.diastolic.toStringBinding())
                        .keyboardType(.numberPad)
                }
            }
            
            
            Section("Pulse:") {
                LabeledContent("Pulse:") {
                    TextField("Pulse", text: $log.pulse.toStringBinding())
                        .keyboardType(.numberPad)
                }
            }
            
            
            
            
            
            Section("Arm:") {
                Picker("Arm", selection: $log.arm.defaultValue("right")) {
                    ForEach(ArmType.allCases) {
                        Text($0.rawValue.capitalized).tag($0.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            
            Section("Date:") {
                DatePicker("Date", selection: $log.date.defaultValue(.now))
            }
            



        }
        
        .navigationTitle("Add Log")
        
        
    }
}

#Preview {
    NavigationStack {
        AddLogView(ChildContextObjectContainer(CoreDataManager.preview.container.viewContext, .log).object.castedAsLog())
    }
}
