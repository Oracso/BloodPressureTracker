//
//  LogDetailView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import SwiftUI

struct LogDetailView: View {
    
    init(_ log: Log) {
        self.log = log
    }
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var log: Log
    
    @EnvironmentObject var vem: ViewEditingManager
    
    
    var body: some View {
        
        
        List {
            
            Section("Systolic:") {
                if vem.isEditing {
                    LabeledContent("Systolic:") {
                        TextField("Systolic", text: $log.systolic.toStringBinding())
                            .keyboardType(.numberPad)
                    }
                } else {
                    Text("Systolic: \(log.systolic)")
                }
            }
            
            Section("Diastolic:") {
                if vem.isEditing {
                    LabeledContent("Diastolic:") {
                        TextField("Diastolic", text: $log.diastolic.toStringBinding())
                            .keyboardType(.numberPad)
                    }
                } else {
                    Text("Diastolic: \(log.diastolic)")
                }
            }
            
            
            Section("Pulse:") {
                if vem.isEditing {
                    LabeledContent("Pulse:") {
                        TextField("Pulse", text: $log.pulse.toStringBinding())
                            .keyboardType(.numberPad)
                    }
                } else {
                    Text("Pulse: \(log.pulse)")
                }
            }
            
            
            Section("Arm:") {
                if vem.isEditing {
                    Picker("Arm", selection: $log.arm.defaultValue("right")) {
                        ForEach(ArmType.allCases) {
                            Text($0.rawValue.capitalized).tag($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                } else {
                    Picker("Arm", selection: $log.arm.defaultValue(log.unwrappedArm)) {
                        ForEach(ArmType.allCases) {
                            Text($0.rawValue.capitalized).tag($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .disabled(true)
                }
            }
            
            
            Section("Date:") {
                if vem.isEditing {
                    DatePicker("Date:", selection: $log.date.defaultValue(.now))
                } else {
                    DatePicker("Date:", selection: $log.date.defaultValue(.now))
                        .disabled(true)
                }
            }
            
            
            ConfoundersParentView(log: log)
            
            Section("Notes:") {
                if vem.isEditing {
                    TextEditor(text: $log.notes.defaultValue(""))
                        .frame(minHeight: 75)
                } else {
                    if let notes = log.notes {
                        Text(notes)
                    }
                }
            }
            
            GenericDeleteObjectButton(log, dismiss)
            
            
        }
        
        .navigationTitle(log.formattedDate)
        
        
    }
}


#Preview {
    NavigationStack {
        LogDetailView(CoreDataPreviewManager.fetchPreviewObject(.log))
            .environmentObject(ViewEditingManager(CoreDataManager.preview.container.viewContext))
    }
}
