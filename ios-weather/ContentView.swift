//
//  ContentView.swift
//  ios-weather
//
//  Created by S on 2024/7/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient:/*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/,
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(spacing: 9){
                Text("Sangenjaya")
                    .font(.system(size: 32, weight: .semibold, design: .default))
                
                VStack {
                    Image(systemName: "snow")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170, height: 170, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("0°")
                        .font(.system(size: 92, weight: .semibold, design: .default))
                }
                Spacer()
                HStack(spacing: 14){
                    WeatherDayView(day: "1",
                                   image: "snow",
                                   tem: 0)
                    WeatherDayView(day: "2",
                                   image: "snow",
                                   tem: 0)
                    WeatherDayView(day: "3",
                                   image: "snow",
                                   tem: 0)
                    WeatherDayView(day: "4",
                                   image: "snow",
                                   tem: 0)
                    WeatherDayView(day: "5",
                                   image: "snow",
                                   tem: 0)
                    
                }
                
            }
        }
    }
    
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var day: String
    var image: String
    var tem: Int
    
    var body: some View {
        VStack(spacing: 16){
            Text(day)
                .font(.system(size: 17, weight: .semibold, design: .default))
            
            VStack {
                Image(systemName: image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 53, height: 53, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("\(tem)°")
                    .font(.system(size: 33, weight: .semibold, design: .default))
            }
        }
    }
}
