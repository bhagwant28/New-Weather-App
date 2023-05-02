//
//  LoadingView.swift
//  Weather
//
//  Created by Bhagwant Sangvikar on 02/05/23.
//

import SwiftUI
import CoreLocation

struct LoadingView: View {
 
    var body: some View {
        ZStack {
            
            VStack {
                Text("Loading your amazing weather!")
                    .font(.body)
                    .foregroundColor(Color.white)
                
            }
            .padding()
            .frame(width:300, height: 150)
            .background(Color.orange)
            .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }        
}


struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
