//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import Foundation

@MainActor class WeatherViewModel: ObservableObject {
    @Published var weather: ResponseBody?
    @Published var weatherManager = WeatherManager()
    @Published var name: String = ""
    @Published var feelsLike: String = "0.0"
    @Published var weathers: String = ""
    @Published var minTemp: String = ""
    @Published var maxTemp: String = ""
    @Published var humidity: String = ""
    @Published var windSpeed: String = ""
    private var cityName: String = ""
    
    init() {
        doRegularWork()
    }
    init(city: String) {
        cityName = city
        doCityRegular()
    }
    
    func doRegularWork() {
        Task {
            await fetchDetails()
        }
    }
    
    func doCityRegular() {
        Task {
            await fetchCityDetails()
        }
    }
    
    
    func fetchCityDetails() async {
        do {
            weather = try await weatherManager.getCurrentWeatherForCity(cityName: cityName)
            if let weather = weather {
                name = weather.name
                feelsLike = weather.main.feelsLike.roundDouble()
                weathers = weather.weather[0].main
                minTemp =  weather.main.tempMin.roundDouble()
                maxTemp = weather.main.tempMax.roundDouble()
                humidity = weather.main.humidity.roundDouble()
                windSpeed = weather.wind.speed.roundDouble()
            }
        } catch {
            print("Error getting weather: \(error)")
        }
    }
    
    func fetchDetails() async {
        if let location = LocationManager.shared.location {
            do {
                weather = try await weatherManager.getCurrentWeather(lat: location.latitude, lon: location.longitude)
                if let weather = weather {
                    name = weather.name
                    feelsLike = weather.main.feelsLike.roundDouble()
                    weathers = weather.weather[0].main
                    minTemp =  weather.main.tempMin.roundDouble()
                    maxTemp = weather.main.tempMax.roundDouble()
                    humidity = weather.main.humidity.roundDouble()
                    windSpeed = weather.wind.speed.roundDouble()
                }
            } catch {
                print("Error getting weather: \(error)")
            }
        }
    }
}
