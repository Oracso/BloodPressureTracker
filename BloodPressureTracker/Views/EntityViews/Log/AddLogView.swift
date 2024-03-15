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
    
    @State private var notes: Bool = false
    
    @FocusState var keyboardActive: Bool
    
    var body: some View {
        
        List {
            
            Section("Systolic:") {
                LabeledContent("Systolic:") {
                    TextField("Systolic", text: $log.systolic.toStringBinding())
                        .keyboardType(.numberPad)
                        .focused($keyboardActive)
                }
            }
            
            Section("Diastolic:") {
                LabeledContent("Diastolic:") {
                    TextField("Diastolic", text: $log.diastolic.toStringBinding())
                        .keyboardType(.numberPad)
                        .focused($keyboardActive)
                }
            }
            
            
            Section("Pulse:") {
                LabeledContent("Pulse:") {
                    TextField("Pulse", text: $log.pulse.toStringBinding())
                        .keyboardType(.numberPad)
                        .focused($keyboardActive)
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
            

            ConfoundersParentView(log: log, addLogView: true)
                
            
            Section("Notes:") {
                if notes {
                    TextEditor(text: $log.notes.defaultValue(""))
                        .frame(minHeight: 75)
                }
                Toggle(notes ? "Remove Notes" : "Add Notes", isOn: $notes)
                
            }


        }
        
        .navigationTitle("Add Log")
        
        
        .onChange(of: notes) {
            if notes == false {
                log.notes = nil
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Spacer()
                    Button("Done") {
                        keyboardActive = false
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    NavigationStack {
        AddLogView(ChildContextObjectContainer(CoreDataManager.preview.container.viewContext, .log).object.castedAsLog())
            .environmentObject(ViewEditingManager(CoreDataManager.preview.container.viewContext))
    }
}
