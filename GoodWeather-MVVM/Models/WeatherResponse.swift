//
//  WeatherResponse.swift
//  GoodWeather-MVVM
//
//  Created by Kürşat Şimşek on 10.12.2022.
//

import Foundation

struct WeatherResponse: Decodable {
    let name: String
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
