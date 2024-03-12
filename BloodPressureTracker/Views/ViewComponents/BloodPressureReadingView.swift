//
//  BloodPressureReadingView.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 12/03/2024.
//

import SwiftUI

struct BloodPressureReadingView: View {
    let systolic: Double
    let diastolic: Double
    let pulse: Double
    
    var body: some View {
        
        
        
        VStack {
            
            HStack(spacing: 15) {
                
                HStack(spacing: 5) {
                    Image(systemName: "heart")
                        .foregroundStyle(.red)
                    Text(String(pulse.roundToIntOrDouble()))
                    
                    Text("bpm")
                        .font(.system(size: 10))
                        .foregroundStyle(.gray)
                }
                
                
                HStack {
                    VStack(spacing: 5) {
                        Text(String(systolic.roundToIntOrDouble()))
                        Divider()
                        Text(String(diastolic.roundToIntOrDouble()))
                    }
                    .fixedSize(horizontal: true, vertical: true)
                    
                    Text("mmHg")
                        .font(.system(size: 10))
                        .foregroundStyle(.gray)
                    
                }
                
                
                
            }
            
            
        }
        
        
        
    }
}

#Preview {
    BloodPressureReadingView(systolic: 105, diastolic: 69, pulse: 114)
}
