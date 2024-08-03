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

enum AMockData {
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

	static let orderItemOne = Appetizer(
		id: 0001,
		name: "test 1",
		description: "tesing",
		price: 777,
		imageURL: "",
		calories: 10,
		protein: 35,
		carbs: 0
	)
	static let orderItemTwo = Appetizer(
		id: 0002,
		name: "test 2",
		description: "tesing",
		price: 777,
		imageURL: "",
		calories: 10,
		protein: 35,
		carbs: 0
	)
	static let orderItemThree = Appetizer(
		id: 0003,
		name: "test 3",
		description: "tesing",
		price: 777,
		imageURL: "",
		calories: 10,
		protein: 35,
		carbs: 0
	)
	
	static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
