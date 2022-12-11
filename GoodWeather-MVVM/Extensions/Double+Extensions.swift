//
//  Double+Extensions.swift
//  GoodWeather-MVVM
//
//  Created by Kürşat Şimşek on 11.12.2022.
//

import Foundation

extension Double {
    func formatAsDegree() -> String {
        return String(format: "%.0f°", self)
    }
}
