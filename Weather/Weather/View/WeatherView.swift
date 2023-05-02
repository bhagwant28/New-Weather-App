//
//  WeatherView.swift
//  Weather
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var vm = WeatherViewModel()
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                topCityDateView()
                
                Spacer()
                
                VStack {
                    topHStackView()
                    
                    Spacer()
                        .frame(height:  80)
                    
                    cityImageView()
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
          bottomView()
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

extension WeatherView {
     func topCityDateView() -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(vm.name)
                .bold()
                .font(.title)
            
            Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                .fontWeight(.light)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func topHStackView() -> some View {
        HStack {
            VStack(spacing: 20) {
                Image(systemName: "cloud")
                    .font(.system(size: 40))
                
                Text("\(vm.weathers)")
            }
            .frame(width: 150, alignment: .leading)
            
            Spacer()
            
            Text(vm.feelsLike + "°")
                .font(.system(size: 100))
                .fontWeight(.bold)
                .padding()
        }
    }
    
    func cityImageView() -> some View {
        AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350)
        } placeholder: {
            ProgressView()
        }
    }
}

extension WeatherView {
    
    func bottomView() -> some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                Text("Weather now")
                    .bold()
                    .padding(.bottom)
                
                HStack {
                    WeatherRowView(logo: "thermometer", name: "Min temp", value: (vm.minTemp + ("°")))
                    Spacer()
                    WeatherRowView(logo: "thermometer", name: "Max temp", value: (vm.maxTemp + "°"))
                }
                
                HStack {
                    WeatherRowView(logo: "wind", name: "Wind speed", value: (vm.windSpeed + " m/s"))
                    Spacer()
                    WeatherRowView(logo: "humidity", name: "Humidity", value: "\(vm.humidity)%")
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .padding(.bottom, 20)
            .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
            .background(.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
        }
    }
}
