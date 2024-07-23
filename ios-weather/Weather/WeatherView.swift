//
//  ContentView.swift
//  ios-weather
//
//  Created by S on 2024/7/15.
//

import SwiftUI

struct WeatherView: View {
	@State private var status = "night"
	
	var body: some View {
		ZStack {
			BGView(top: status == "night" ? Color("PrimaryBG") : .indigo, bottom: status == "night" ? Color("SecondaryBG") : .teal)
			
			VStack(spacing: 9){
				Text("Sangenjaya")
					.font(.system(size: 32, weight: .semibold, design: .default))
				
				VStack {
					Image(systemName: "snow")
						.renderingMode(.original)
						.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(width: 170, height: 170, alignment: .center)
					Text("0°")
						.font(.system(size: 92, weight: .semibold, design: .default))
				}
				
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
					
				}.padding(30)
				
				Button {
					if status == "night" {
						status = "day"
					} else {
						status = "night"
					}
				} label: {
					Text("Change the Theme!")
						.frame(width: 300, height: 50)
						.background(Color.white)
						.font(.system(size: 20, weight: .bold, design: .monospaced))
						.cornerRadius(30)
				}
			}
		}
	}
	
}

#Preview {
	WeatherView()
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
					.frame(width: 53, height: 53, alignment: .center)
				Text("\(tem)°")
					.font(.system(size: 33, weight: .semibold, design: .default))
			}
		}
	}
}

struct BGView: View {
	var top: Color
	var bottom: Color
	
	var body: some View {
		LinearGradient(gradient:Gradient(colors: [top, bottom]),
					   startPoint: .topLeading,
					   endPoint: .bottomTrailing)
		.ignoresSafeArea(.all)
	}
}
