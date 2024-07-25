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
	static let invalidURL = APPAlertItem(title: Text("Server Error"),
	                                     message: Text("Wrong URL"),
	                                     dismissButton: .default(Text("OK")))

	static let invalidResponse = AlertItem(title: Text("Server Error"),
	                                       message: Text("The value is not valid."),
	                                       dismissButton: .default(Text("OK")))

	static let invalidData = AlertItem(title: Text("Invalid scanned type"),
	                                   message: Text("The value is not valid."),
	                                   dismissButton: .default(Text("OK")))

	static let unableToComplete = AlertItem(title: Text("Invalid scanned type"),
	                                        message: Text("The value is not valid."),
	                                        dismissButton: .default(Text("OK")))
}
