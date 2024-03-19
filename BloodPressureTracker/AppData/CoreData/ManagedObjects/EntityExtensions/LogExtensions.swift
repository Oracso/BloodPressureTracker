//
//  LogExtensions.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import CoreData


extension Log {
    

     public var unwrappedArm: String {
         arm ?? "no record found"
     }

    public var unwrappedDate: Date {
        date ?? .now
    }
    
    public var formattedDate: String {
        DateFormatter.localizedString(from: date ?? .now, dateStyle: .medium, timeStyle: .short)
    }
    
    public var listDate: (date: String, time: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        let dateString = formatter.string(from: date ?? .now)
        formatter.dateFormat = "hh:mm a"
        let time = formatter.string(from: date ?? .now)
        return (dateString, time)
    }
    
    
    public var diastolicInt: Int {
        Int(diastolic)
    }
    
    public var systolicInt: Int {
        Int(systolic)
    }
    
    public var pulseInt: Int {
        Int(pulse)
    }
    
}


// MARK: - ObjectStore FetchRequest

extension Log {
    
    public class func objectStoreFetchRequest() -> NSFetchRequest<Log> {
        let request = NSFetchRequest<Log>(entityName: "Log")
            request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        
        return request
    }

}


//extension Log {
//    static let timeArray: [Log] = [
//        Log(systolic: 174, diastolic: 78, pulse: 50, arm: "right", date: Date.daysDif(-5)),
//        Log(systolic: 145, diastolic: 62, pulse: 50, arm: "right", date: Date().daysBack(4)),
//        Log(systolic: 130, diastolic: 58, pulse: 50, arm: "left", date: Date().daysBack(3)),
//        TestLog(systolic: 178, diastolic: 83, pulse: 50, arm: "right", date: Date().daysBack(2)),
//        TestLog(systolic: 190, diastolic: 91, pulse: 50, arm: "left", date: Date().daysBack(1)),
//        TestLog(systolic: 166, diastolic: 65, pulse: 50, arm: "right", date: Date().daysBack(5)),
//        TestLog(systolic: 150, diastolic: 64, pulse: 50, arm: "right", date: Date().daysBack(4).plusHour(1)),
//        TestLog(systolic: 180, diastolic: 70, pulse: 60, arm: "right" , date: Date().daysBack(3).plusHour(1)),
//        TestLog(systolic: 200, diastolic: 80, pulse: 75, arm: "left" , date: Date().daysBack(2).plusHour(1)),
//        TestLog(systolic: 180, diastolic: 75, pulse: 70, arm: "right" , date: Date().daysBack(1)),
//        TestLog(systolic: 220, diastolic: 90, pulse: 80, arm: "left" , date: Date.now),
//    ]
//}



