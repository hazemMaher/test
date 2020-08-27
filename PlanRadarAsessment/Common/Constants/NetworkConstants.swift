//
//  NetworkConstants.swift
//  FreeNowTask
//
//  Created by Hazem Maher on 10/07/2019.
//  Copyright © 2019 Hazem. All rights reserved.
//

extension C {
    enum NetworkURL {
        static let weather = "api.openweathermap.org/data/2.5/weather"
        static let weatherIcon = "http://openweathermap.org/img/w/%@.png"
    }
    
    enum Network {
        static let header = ["Content-Type": "application/json"]
    }
}
