//
//  AddWeatherCityViewController.swift
//  GoodWeather-MVVM
//
//  Created by Kürşat Şimşek on 30.11.2022.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    static let appId = "18032910c61bd3884b9b478a91f6d219"
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    private var addWeatherVM = AddWeatherViewModel()
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        if let city = cityNameTextField.text {
            addWeatherVM.addWeather(for: city) { vm in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true)
            }
        }
    }
    
    @IBAction func close() {
        self.dismiss(animated: true)
    }
    
}
