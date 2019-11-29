//
//  modeDays.swift
//  Weather_HaNoi
//
//  Created by Nguyễn Đình Thành Long on 11/27/19.
//  Copyright © 2019 Nguyễn Đình Thành Long. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let modeWeather = try? newJSONDecoder().decode(ModeWeather.self, from: jsonData)

import Foundation
import UIKit

// MARK: - ModeWeather
struct ModeWeather: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let sys: Sys
    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, sys
        case dtTxt = "dt_txt"
        case rain
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
struct Rain: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: MainEnum
    let weatherDescription: Description
    let icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

enum MainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

enum Description :String, Codable {
    case clearsky = "clear sky"
    case fcloud = "few clouds"
    case scloud = "overcast clouds"
    case sccloud = "scattered clouds"
    case bcloud = "broken clouds"
    case srain = "shower rain"
    case lrain = "light rain"
    case rain = "rain"
    case thunderstorm = "thunderstorm"
    case snow = "snow"
    case mist = "mist"
    
    var image: UIImage {
        switch self {
        case .clearsky , .fcloud:
            return UIImage.init(named: "sun")!
        case .scloud,.sccloud , .bcloud:
            return UIImage.init(named: "cloud")!
        case .rain , .srain , .lrain:
            return UIImage.init(named: "rain")!
        case .thunderstorm :
            return UIImage.init(named: "storm")!
        case .snow :
            return UIImage.init(named: "snow")!
        default:
            return UIImage.init(named: "wind")!
        }

    }
}


// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

