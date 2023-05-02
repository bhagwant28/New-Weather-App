//
//  SearchByCityName.swift
//  Weather
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import SwiftUI

struct SearchByCityName: View {
    @State private var searchText = ""
    @State var isWeather: Bool = false
    
    var body: some View {
        VStack {
            Text("Searching for \(searchText)")
                .searchable(text: $searchText, prompt: "Look for something")
            
            Button  {
                isWeather.toggle()
            } label: {
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("Search Weather for city")
                    .font(.title3)
            }
        }
        .navigationDestination(isPresented: $isWeather) {
            WeatherView(vm: WeatherViewModel(city: searchText))
        }
    }
}

struct SearchByCityName_Previews: PreviewProvider {
    static var previews: some View {
        SearchByCityName()
    }
}
