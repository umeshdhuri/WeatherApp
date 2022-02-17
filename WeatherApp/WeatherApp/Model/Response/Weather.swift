//
//  Weather.swift
//  WeatherApp
//
//  Created by Umesh Dhuri on 17/02/22.
//

//Data Model for Weather API. For now I have only created Daily weather data model since for this demo I am only using Daily weather data. 

import Foundation

struct WeatherResponse : Decodable {
    let daily: [Daily]
}

struct Daily : Decodable {
    let dt, sunrise, sunset, moonrise: Int
    let moonset: Int
    let moonPhase: Double
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure, humidity: Int
    let dewPoint, windSpeed: Double
    let windDeg: Int
    let windGust: Double
    let weather: [Weather]
    let clouds, pop: Int
    let uvi: Double

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, moonrise, moonset
        case moonPhase = "moon_phase"
        case temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather, clouds, pop, uvi
    }
}

struct Weather : Decodable {
    let id: Int
    let main: String
    let weatherDescription: String
    let icon: Icon

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum Icon: String, Codable {
    case the01D = "01d"
    case the01N = "01n"
    case the02D = "02d"
    case the02N = "02n"
    case the03D = "03d"
    case the04D = "04d"
    case the04N = "04n"
}

struct FeelsLike : Decodable {
    let day, night, eve, morn: Double
}

struct Temp : Decodable {
    let day, min, max, night: Double
    let eve, morn: Double
}
