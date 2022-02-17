//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Umesh Dhuri on 17/02/22.
//

//This is View Model class to get single Daily object from Weather API 

import Foundation
import RxSwift
import RxCocoa

struct WeatherViewModel {
    private let daily : Daily
    private let dateConverter = DateConverter()
    
    var displayDate : Observable<String> {
        return Observable<String>.just(dateConverter.FormatDateToString(dateTimeVal: daily.dt))
    }
    
    var mainWeather : Observable<String> {
        if daily.weather.count > 0 {
            return Observable<String>.just(daily.weather[0].main)
        }else{
            return Observable<String>.just("No Data Found")
        }
    }
    
    var descriptionWeather : Observable<String> {
        if daily.weather.count > 0 {
            return Observable<String>.just(daily.weather[0].weatherDescription)
        }else{
            return Observable<String>.just("No Data Found")
        }
    }
    
    
    
    var temperature : Observable<String> {
        return Observable<String>.just("\(String(daily.temp.day)) °")
    }
    
    var humidity : Observable<String> {
        return Observable<String>.just("Humidity: \(String(daily.humidity))%")
    }
    
    init(daily : Daily) {
        self.daily = daily
    }
}
