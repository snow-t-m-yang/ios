//
//  Alert.swift
//  ios-weather
//
//  Created by S on 2024/7/24.
//

import SwiftUI

struct AlertItem: Identifiable {
	let id = UUID()
	let title: String
	let message: String
	let dismissButton: Alert.Button
}

enum AlertContext {
	static let invalidDeviceInput = AlertItem(title: "Invalid device input",
	                                          message: "Something is wrong",
	                                          dismissButton: .default(Text("OK")))

	static let invalidScannedType = AlertItem(title: "Invalid scanned type",
	                                          message: "The value is not valid.",
	                                          dismissButton: .default(Text("OK")))
}
