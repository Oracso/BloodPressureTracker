//
//  ChartLineColours.swift
//  BloodPressureTracker
//
//  Created by Oscar Hardy on 06/02/2024.
//

import Foundation
import SwiftUI

struct ChartLineColours {
    init(all: Color = .yellow, systolic: Color = .green, diastolic: Color = .orange, pulse: Color = .indigo) {
        self.all = all
        self.systolic = systolic
        self.diastolic = diastolic
        self.pulse = pulse
    }
    
    var all: Color = .cyan
    var systolic: Color = .green
    var diastolic: Color = .orange
    var pulse: Color
}

extension ChartLineColours {
    static let userDefaultsKey = "chartLineColours"
}

extension SettingsManager {
    func loadChartLineColours() {
        if SettingsManager.checkIfFirstLaunch() {
            let string = JSONManager.dictionaryToJsonString(ChartLineColours.defaultColorStrings)
            defaults.setValue(string, forKey: ChartLineColours.userDefaultsKey)
        } else {
            let string = defaults.value(forKey: ChartLineColours.userDefaultsKey) as? String ?? ""
            let coloursDic = JSONManager.jsonStringToDictionary(string, String.self, String.self)
            chartLineColours.all = ChartLineColours.colourFromString(coloursDic["all"] ?? "")
            chartLineColours.systolic = ChartLineColours.colourFromString(coloursDic["systolic"] ?? "")
            chartLineColours.diastolic = ChartLineColours.colourFromString(coloursDic["diastolic"] ?? "")
            chartLineColours.pulse = ChartLineColours.colourFromString(coloursDic["pulse"] ?? "")
        }
    }
}

extension ChartLineColours {
    func saveColours() {
        let dic = ChartLineColours.allColoursComponents([all, systolic, diastolic, pulse])
        let string = JSONManager.dictionaryToJsonString(dic)
        UserDefaults.standard.setValue(string, forKey: ChartLineColours.userDefaultsKey)
    }
}

extension ChartLineColours {
    // TODO: Just use array instead ?
    static let defaultColorStrings = [
        "all":ChartLineColours.colourComponents(.cyan),
        "systolic":ChartLineColours.colourComponents(.green),
        "diastolic":ChartLineColours.colourComponents(.orange),
        "pulse": ChartLineColours.colourComponents(.indigo)
    ]
}


extension ChartLineColours {
    static func allColoursComponents(_ colours: [Color]) -> [String: String] {
        var dic = [String: String]()
        let colourPropertyNames: [String] = defaultColorStrings.keys.map({ string in String(string)})
        print(colourPropertyNames)
        var count = 0
        for colour in colours {
            dic[colourPropertyNames[count]] = colourComponents(colour)
            count += 1
        }
        return dic
    }
    
    static func colourComponents(_ colour: Color) -> String {
        let resolved: Color.Resolved = colour.resolve(in: .init())
        let components = resolved.cgColor.components ?? []
        let string = components.map({ $0.description })
        let joined = string.joined(separator: ",")
        return joined
    }
    
    static func colourFromString(_ string: String) -> Color {
        let components = string.split(separator: ",").compactMap( { string in String(string)})
        let red = Double(components[0]) ?? 0
        let green = Double(components[1]) ?? 0
        let blue = Double(components[2]) ?? 0
        let alpha = Double(components[3]) ?? 0
        return Color(red: red, green: green, blue: blue, opacity: alpha)
    }
}

//func setDataTypeColour(_ filterType: LogDataType) -> Color {
//    switch filterType {
//    case .systolic:
//        return lineColourSchemes.systolic
//    case .diastolic:
//        return lineColourSchemes.diastolic
//    case .pulse:
//        return lineColourSchemes.pulse
//    }
//}
//
//
//
//func setLineColour(_ filterType: DataTypeFilterTypes) -> Color {
//    switch filterType {
//    case .allFilter:
//        return lineColourSchemes.all
//    case .systolicFilter:
//        return lineColourSchemes.systolic
//    case .diastolicFilter:
//        return lineColourSchemes.diastolic
//    case .pulseFilter:
//        return lineColourSchemes.pulse
//    }
//}
