//
//  OptionalFunc.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation

struct OptionalFunc {
    
    init(_ call: Func? = nil) {
        if let call {
            self.call = call
        } else {
            self.call = {}
        }
        
    }
    
    typealias Func = () -> Void
    
    var call: Func
    
}

extension OptionalFunc {
    static let blank = OptionalFunc()
}
