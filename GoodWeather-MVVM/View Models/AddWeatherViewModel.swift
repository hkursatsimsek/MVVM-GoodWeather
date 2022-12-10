//
//  AddWeatherViewModel.swift
//  GoodWeather-MVVM
//
//  Created by Kürşat Şimşek on 10.12.2022.
//

import Foundation

class AddWeatherViewModel {
    
    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        let resource = Resource<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }
        
        WebService().load(resource: resource) { result in
            if let weatherResource = result {
                let vm = WeatherViewModel(weather: weatherResource)
                completion(vm)
            }
        }
    }
    
}
