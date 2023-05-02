//
//  LocationContentView.swift
//  Weather
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import SwiftUI
import CoreLocationUI

struct LocationContentView: View {
    @StateObject var locationManager = LocationManager.shared
    @StateObject var wvm = WeatherViewModel()
    @State var isSearch: Bool = false
    
    var body: some View {
        VStack {
            Text("Welcome to the Weather App")
                .multilineTextAlignment(.leading)
                .font(.title)
                .foregroundColor(.blue)
            
            Image("weather1")
                .resizable()
                .scaledToFill()
                .frame(width: 180, height: 180)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding([.bottom,.top], 50)

            if let location = locationManager.location {
                Text("Your location: Lat \(location.latitude), Long \(location.longitude)")
                    .font(.title)
            }
            LocationButton(.currentLocation) {
                locationManager.requestLocation()
            }
            .symbolVariant(.fill)
            .labelStyle(.iconOnly)
            .foregroundColor(.white)
            .cornerRadius(20)
            .font(.system(size: 20))
            .padding([.bottom,.top], 50)
            Button {
                isSearch.toggle()
            } label: {
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("Search Location")
            }
            if locationManager.isLoading {
                LoadingView()
            }
        }
        .navigationDestination(isPresented: $locationManager.moveWeather) {
            WeatherView()
        }
        .navigationDestination(isPresented: $isSearch) {
            SearchByCityName()
        }
    }
}

struct LocationContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationContentView()
    }
}

