//
//  AppetizerListViewModal.swift
//  ios-weather
//
//  Created by S on 2024/7/25.
//

import SwiftUI

final class AppetizerListViewModal: ObservableObject {
	@Published var appetizers: [Appetizer] = []
	@Published var appAlertItem: APPAlertItem?

	func getAppetizers() {
		NetworkManager.shared.getAppetizers { result in
			DispatchQueue.main.async {
				switch result {
				case .success(let appetizers):
					self.appetizers = appetizers
				case .failure(let error):
					switch error {
					case .invalidResponse:
						self.appAlertItem = APPAlertContext.invalidResponse

					case .invalidData:
						self.appAlertItem = APPAlertContext.invalidData

					case .invalidURL:
						self.appAlertItem = APPAlertContext.invalidURL

					case .unableToComplete:
						self.appAlertItem = APPAlertContext.unableToComplete
					}
				}
			}
		}
	}
}
