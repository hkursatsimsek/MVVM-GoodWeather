//
//  WeatherListTableViewController.swift
//  GoodWeather-MVVM
//
//  Created by Kürşat Şimşek on 30.11.2022.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    
}

extension WeatherListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else { return UITableViewCell()}
    
//      MARK: hücrenin default özelliklerine yeni sürümde böyle erişiyoruz.
        /*
        var content = cell.defaultContentConfiguration()
        content.text = "Suvas"
        content.secondaryText = "33"
        content.textProperties.color = .red
        content.textProperties.font = .boldSystemFont(ofSize: 14)
        cell.contentConfiguration = content
         */
        
        let weatherVM = weatherListViewModel.modelAt(indexPath.row)
        
        cell.configure(weatherVM)
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        }
    }
    
    func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found!")
        }
        
        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherCityViewController not found")
        }
        
        addWeatherCityVC.delegate = self
    }
}
