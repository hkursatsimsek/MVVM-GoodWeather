//
//  SettingsViewModel.swift
//  GoodWeather-MVVM
//
//  Created by Kürşat Şimşek on 11.12.2022.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "impreial"
}

extension Unit {
    var displayName: String {
        get {
            switch(self) {
                case .celsius:
                    return "Celcius"
                case .fahrenheit:
                    return "Fahrenheit"
            }
        }
    }
}

class SettingsViewModel {
    let units = Unit.allCases
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String {
                unitValue = value
            }
            return Unit(rawValue: unitValue)!
        }
        set {
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
