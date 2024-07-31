//
//  AppetizerDetailView.swift
//  ios-weather
//
//  Created by S on 2024/7/30.
//

import SwiftUI

struct AppetizerDetailView: View {
	let apptizer: Appetizer
	@Binding var isShowingDetail: Bool
	
	var body: some View {
		VStack {
			AppetizerRemoteImage(urlString: apptizer.imageURL)
				.aspectRatio(contentMode: .fit)
				.frame(width: 300, height: 225)
			
			VStack {
				Text(apptizer.name)
					.font(.title2)
					.fontWeight(.semibold)
				
				Text(apptizer.description)
					.multilineTextAlignment(.center)
					.font(.body)
					.padding()
				
				HStack(spacing: 40) {
					VStack(spacing: 5) {
						Text("Calories")
							.bold()
							.font(.caption)
							
						Text("\(apptizer.calories)")
							.foregroundColor(.secondary)
							.fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
							.italic()
					}
					VStack(spacing: 5) {
						Text("Protein")
							.bold()
							.font(.caption)
							
						Text("\(apptizer.protein)")
							.foregroundColor(.secondary)
							.fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
							.italic()
					}
					VStack(spacing: 5) {
						Text("Carbs")
							.bold()
							.font(.caption)
							
						Text("\(apptizer.carbs)")
							.foregroundColor(.secondary)
							.fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
							.italic()
					}
				}
			}
			Spacer()
			
			Button {
//				isShowingDetail = false
			} label: {
				AFButton(title: "$\(apptizer.price) - Add to Order")
			}
			.padding(.bottom, 30)
		}
		.frame(width: 300, height: 525)
		.background(Color(.systemBackground))
		.cornerRadius(20)
		.shadow(radius: 40)
		.overlay(Button {
			isShowingDetail = false
		} label: {
			ZStack {
				Circle()
					.frame(width: 30, height: 30)
					.foregroundColor(.white)
					.opacity(0.6)
				Image(systemName: "xmark")
					.imageScale(.small)
					.frame(width: 44, height: 44, alignment: .center)
					.foregroundColor(.black)
			}
		}, alignment: .topTrailing)
	}
}

#Preview {
	AppetizerDetailView(apptizer: AMockData.sampleAppetizer, isShowingDetail: .constant(true))
}
