////
////  JsonWeather.swift
////  Weather_HaNoi
////
////  Created by Nguyễn Đình Thành Long on 11/25/19.
////  Copyright © 2019 Nguyễn Đình Thành Long. All rights reserved.
////
//
//import Foundation
//
//
//// MARK: - Weather
//struct Weather: Codable  {
//    let coord: Coord
//    let weather: [WeatherElement]
//    let base: String
//    let main: Main
//    let visibility: Int
//    let wind: Wind
//    let clouds: Clouds
//    let dt: Int
//    let sys: Sys
//    let timezone, id: Int
//    let name: String
//    let cod: Int
//}
//
//// MARK: - Clouds
//struct Clouds: Codable {
//    let all: Int
//}
//
//// MARK: - Coord
//struct Coord: Codable {
//    let lon, lat: Double
//}
//
//// MARK: - Main
//struct Main: Codable {
//    let temp, pressure, humidity, tempMin: Int
//    let tempMax: Int
//
//    enum CodingKeys: String, CodingKey {
//        case temp, pressure, humidity
//        case tempMin = "temp_min"
//        case tempMax = "temp_max"
//    }
//}
//
//// MARK: - Sys
//struct Sys: Codable {
//    let type, id: Int
//    let country: String
//    let sunrise, sunset: Int
//}
//
//// MARK: - WeatherElement
//struct WeatherElement: Codable {
//    let id: Int
//    let main, weatherDescription, icon: String
//
//    enum CodingKeys: String, CodingKey {
//        case id, main
//        case weatherDescription = "description"
//        case icon
//    }
//}
//
//// MARK: - Wind
//struct Wind: Codable {
//    let speed: Double
//}
