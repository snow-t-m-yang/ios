//
//  AppetizerDetailView.swift
//  ios-weather
//
//  Created by S on 2024/7/30.
//

import SwiftUI

struct AppetizerDetailView: View {
	
	@EnvironmentObject var order: Order
	
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
					NutritionInfo(
						title: "Calories",
						value: apptizer.calories
					)
					NutritionInfo(
						title: "Protein",
						value: apptizer.protein
					)
					NutritionInfo(
						title: "Carbs",
						value: apptizer.carbs
					)
				}
			}
			Spacer()
			
			Button {
				order.add(apptizer)
				isShowingDetail = false
			} label: {
				AFButton(title: "$\(apptizer.price, specifier: "%.2f") - Add to Order")
			}
			.padding(.bottom, 30)
		}
		.frame(width: 300, height: 525)
		.background(Color(.systemBackground))
		.shadow(radius: 30)
		.overlay(Button {
			isShowingDetail = false
		} label: {
			DismissButton()
		}, alignment: .topTrailing)
		.border(Color.gray)
		.cornerRadius(30)
	}
}

#Preview {
	AppetizerDetailView(
		apptizer: AMockData.sampleAppetizer,
		isShowingDetail: .constant(
			true
		)
	)
}

struct NutritionInfo: View {
	let title: String
	let value: Int
	
	var body: some View {
		VStack(spacing: 5) {
			Text(title)
				.bold()
				.font(.caption)
			
			Text("\(value)")
				.foregroundColor(.secondary)
				.fontWeight(.bold)
				.italic()
		}
	}
}
