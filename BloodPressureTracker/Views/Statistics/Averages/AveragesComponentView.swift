//
//  AveragesComponentView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 08/02/2024.
//

import SwiftUI

struct AveragesComponentView: View {
    @Binding var average: Double
    let logDataType: LogDataType
    var body: some View {
        VStack {
            Text(logDataType.rawValue.capitalized)
            ZStack {
                Circle()
                    .frame(maxWidth: 75)
                    .foregroundStyle(.green)
                
                if average == 0 {
                    Text("N/A")
                } else {
                    Text(average.roundToIntOrDouble())
                }
                
            }
        }
    }
}

#Preview {
    AveragesComponentView(average: .createBinding(56.7), logDataType: .diastolic)
}
