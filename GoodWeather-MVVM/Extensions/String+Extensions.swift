//
//  String+Extensions.swift
//  GoodWeather-MVVM
//
//  Created by Kürşat Şimşek on 10.12.2022.
//

import Foundation

extension String {
    
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
