//
//  AddWeatherCityViewController.swift
//  GoodWeather-MVVM
//
//  Created by Kürşat Şimşek on 30.11.2022.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    
    static let appId = "18032910c61bd3884b9b478a91f6d219"
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(AddWeatherCityViewController.appId)")!
            
            let weatherResource = Resource<Any>(url: weatherURL) { data in
                return data
            }
            
            WebService().load(resource: weatherResource) { result in
                
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true)
    }
    
}
