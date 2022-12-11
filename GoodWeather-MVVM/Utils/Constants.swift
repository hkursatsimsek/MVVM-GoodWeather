//
//  Constants.swift
//  GoodWeather-MVVM
//
//  Created by Kürşat Şimşek on 10.12.2022.
//

import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            // get the default settings for temperature
            let userDefaults = UserDefaults.standard
            let unit = userDefaults.value(forKey: "unit") as? String ?? "imperial"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=18032910c61bd3884b9b478a91f6d219&units=\(unit)")!
        }
        
    }
    
}
