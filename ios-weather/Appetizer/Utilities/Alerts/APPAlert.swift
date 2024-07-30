//
//  Alert.swift
//  ios-weather
//
//  Created by S on 2024/7/25.
//

import SwiftUI

struct APPAlertItem: Identifiable {
	let id = UUID()
	let title: Text
	let message: Text
	let dismissButton: Alert.Button
}

enum APPAlertContext {
	static let invalidURL = APPAlertItem(
		title: Text(
			"Server Error"
		),
		message: Text(
			"Wrong URL"
		),
		dismissButton: .default(
			Text(
				"OK"
			)
		)
	)

	static let invalidResponse = APPAlertItem(
		title: Text(
			"Server Error"
		),
		message: Text(
			"Invlid response from the server"
		),
		dismissButton: .default(
			Text(
				"OK"
			)
		)
	)

	static let invalidData = APPAlertItem(
		title: Text(
			"Server Error"
		),
		message: Text(
			"Errro with server"
		),
		dismissButton: .default(
			Text(
				"OK"
			)
		)
	)

	static let unableToComplete = APPAlertItem(
		title: Text(
			"Server Error"
		),
		message: Text(
			"Error occurs, can't complete."
		),
		dismissButton: .default(
			Text(
				"OK"
			)
		)
	)
}
