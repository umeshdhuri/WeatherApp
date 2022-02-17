//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Umesh Dhuri on 17/02/22.
//

//This is can View Model class to get List of Daily object from Weather API

import Foundation
import RxSwift

class WeatherListViewModel {
    
    private let weatherResource : WeatherResourceProtocol
    
    init(resource : WeatherResource = WeatherResource()) {
        self.weatherResource = resource
    }
    
    func getWeatherVideModels() -> Observable<[WeatherViewModel]> {
        weatherResource.getWatherDailyData().map { $0.map { WeatherViewModel(daily: $0) }}
    }
    
}
