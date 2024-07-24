//
//  BarcodeScannerViewModal.swift
//  ios-weather
//
//  Created by S on 2024/7/24.
//

import SwiftUI

final class BarcodeScannerViewModal: ObservableObject {
	@Published var scannedCode = ""
	@Published  var alertItem: AlertItem?
	
	var statusText: String {	
		scannedCode.isEmpty ? "No" : scannedCode
	}
	
	var statusTextColor: Color {
		scannedCode.isEmpty ? .red : .green
	}
}
