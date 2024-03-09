//
//  Extensions.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import SwiftUI

extension Binding {
    
    /// Ensure default Type is correct -- Otherwise will crash
    public func defaultValue<T>(_ value: T) -> Binding<T> where Value == Optional<T> {
        Binding<T> {
            wrappedValue ?? value
        } set: {
            wrappedValue = $0
        }
    }

}


// MARK: - Create Binding

extension Binding {
    static func createBinding(_ value: Value) -> Binding<Value> {
        var bindingValue = value
        return Binding(
            get: { bindingValue },
            set: { newValue in
                bindingValue = newValue
            }
        )
    }
}

extension Binding where Value == Int64 {
    func toStringBinding() -> Binding<String> {
        Binding<String>(
            get: { String(self.wrappedValue) },
            set: { newValue in
                if let intValue = Int64(newValue) {
                    self.wrappedValue = intValue
                }
            }
        )
    }
}


extension Date {

    static func yearsDif(_ years: Int) -> Date {
        let seconds = Double(31536000 * years)
        return Date.now.addingTimeInterval(seconds)
    }
    
    static func daysDif(_ days: Int) -> Date {
        let seconds = Double(86400 * days)
        return Date.now.addingTimeInterval(seconds)
    }
    
    static func hoursDif(_ hours: Int) -> Date {
        let seconds = Double(3600 * hours)
        return Date.now.addingTimeInterval(seconds)
    }
    
}




public extension UIApplication {
    func currentUIWindow() -> UIWindow? {
        let connectedScenes = UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
        
        let window = connectedScenes.first?
            .windows
            .first { $0.isKeyWindow }
        return window
    }
}



extension Double {
    func roundToIntOrDouble() -> String {
        
        func intOrDouble(_ answer: Double) -> IntOrDouble {
            if answer.truncatingRemainder(dividingBy: 1) == 0 {
                return .int(Int(answer))
            } else {
                return .double(answer)
            }
        }
        
        enum IntOrDouble {
            case int(Int)
            case double(Double)
        }
        
        var answer: String {
            let ans = intOrDouble(self)
            switch ans {
            case .int(let int):
                return String(int)
            case .double(let double):
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 2
                return formatter.string(from: NSNumber(value: double)) ?? "-666"
            }
        }
        
        return answer
        
    }
}
