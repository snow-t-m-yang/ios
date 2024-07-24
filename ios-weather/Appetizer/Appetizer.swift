//
//  Appetizer.swift
//  ios-weather
//
//  Created by S on 2024/7/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
	let id: Int
	let name: String
	let description: String
	let price: Double
	let imageURL: String
	let calories: Int
	let protein: Int
	let carbs: Int
}

struct AppetizerResponse: Decodable {
	let request: [Appetizer]
}

struct AMockData {
	static let sampleAppetizer = Appetizer(
		id: 0001,
		name: "test",
		description: "tesing",
		price: 777,
		imageURL: "",
		calories: 10,
		protein: 35,
		carbs: 0
	)

	static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
