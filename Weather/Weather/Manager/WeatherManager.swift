//
//  WeatherManager.swift
//  Weather
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import Foundation
import CoreLocation

class WeatherManager {
    private let key = "907421a9c6283fb9a2d0d178b5898e33"
    
    // HTTP request to get the current weather depending on the coordinates we got from LocationManager
    func getCurrentWeather(lat: CLLocationDegrees, lon: CLLocationDegrees) async throws -> ResponseBody {
        // Replace YOUR_API_KEY in the link below with your own
        //https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={API key}
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(key)") else { fatalError("Missing URL") }
        
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
    
    
    func getCurrentWeatherForCity(cityName: String) async throws -> ResponseBody {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(key)") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
    }
}


