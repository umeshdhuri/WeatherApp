//
//  APILinks.swift
//  WeatherApp
//
//  Created by Umesh Dhuri on 17/02/22.
//

//This class will be use for creating API urls 


import Foundation

final class APILinks {
    static let instance = APILinks()
    
    private let baseURL : String = "https://api.openweathermap.org/data/2.5/onecall"
    private let latitude : Double = 18.516726
    private let longitude : Double = 73.856255
    private let apiKey : String = "cda6cbf662ea6995ba2cc469b958a06e"
    
    func getGetWeatherDataURL() -> String {
        return "\(baseURL)?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=metric"
    }
}


