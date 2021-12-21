//
//  Model.swift
//  Weather Application
//
//  Created by R on 17/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import Foundation

//struct GetWeather:Codable {
//    let coord:Coord
//    let weather:[Weather]
//    let base:String
//    let main:Main
//    let visibility:Int
//    let wind:Wind
//    let clouds:Clouds
//    let dt:Int
//    let sys:Sys
//    let timezone:Int
//    let id:Int
//    let name:String
//    let cod:Int
//}
//
//struct Coord:Codable {
//    let lon:Double
//    let lat:Double
//}
//
//struct Weather:Codable {
//    let id:Int
//    let main:String
//    let description:String
//    let icon:String
//}
//struct Main:Codable {
//    let temp:Double
//    let feels_like:Double
//    let temp_min:Double
//    let temp_max:Double
//    let pressure:Int
//    let humidity:Int
//}
//struct Wind:Codable {
//    let speed:Double
//    let deg:Int
//}
//struct Clouds:Codable {
//    let all:Int
//}
//struct Sys:Codable {
//    let type:Int
//    let id:Int
//    let country:String
//    let sunrise:Int
//    let sunset:Int
//}


//struct GetWeather:Codable {
//    let lat:Double
//    let lon:Double
//    let timezone:String
//    let timezone_offset:Int
//    let current:Current
//    let hourly:[Hourly]
//}
//
//struct Current:Codable {
//    let dt: Int
//    let sunrise: Int?
//    let sunset: Int?
//    let temp: Double
//    let feels_like: Double
//    let pressure: Int
//    let humidity: Int
//    let dew_point: Double
//    let uvi: Double
//    let clouds: Int
//    let visibility: Int
//    let wind_speed: Double
//    let wind_deg: Int
//    let wind_gust: Double?
//    let weather:[Weather]
//    let pop: Int?
//
//}
//
//struct Weather:Codable {
//    let id: Int
//    let main: String
//    let description: String
//    let icon:String
//}
//
//struct Hourly:Codable {
//    let dt: Int
//    let temp: Double
//    let feels_like: Double
//    let pressure: Int
//    let humidity: Int
//    let dew_point: Double
//    let uvi: Int
//    let clouds: Int
//    let visibility: Int
//    let wind_speed:Double
//    let wind_deg:Int
//    let wind_gust: Double
//    let weather: [Weather]
//    let pop: Int
//}

//struct Hourlyweather :Codable{
//      let id: Int
//      let main: String
//      let description: String
//      let icon:String
//}



struct Welcome: Codable {
    let lat, lon: Double
    let timezone: String
    let timezoneOffset: Int
    let current: Current
    let hourly: [Current]

    enum CodingKeys: String, CodingKey {
        case lat, lon, timezone
        case timezoneOffset = "timezone_offset"
        case current, hourly
    }
}

// MARK: - Current
struct Current: Codable {
    let dt: Int
    let sunrise, sunset: Int?
    let temp, feelsLike: Double
    let pressure, humidity: Int
    let dewPoint, uvi: Double
    let clouds, visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let weather: [Weather]
    let windGust: Double?
    let pop: Int?

    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp
        case feelsLike = "feels_like"
        case pressure, humidity
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather
        case windGust = "wind_gust"
        case pop
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: Main
    let weatherDescription: Description
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum Main: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
}

enum Description: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case scatteredClouds = "scattered clouds"
}




