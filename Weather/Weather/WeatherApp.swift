//
//  WeatherApp.swift
//  Weather
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import SwiftUI

@main
struct WeatherApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                LocationContentView()
            }
        }
    }
}
