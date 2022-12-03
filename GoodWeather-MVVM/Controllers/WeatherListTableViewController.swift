//
//  WeatherListTableViewController.swift
//  GoodWeather-MVVM
//
//  Created by Kürşat Şimşek on 30.11.2022.
//

import Foundation
import UIKit

class WeatherListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
}

extension WeatherListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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
        
        cell.cityNameLabel.text = "Sivas"
        cell.temperatureLabel.text = "20° "
        
        
        return cell
    }
}
