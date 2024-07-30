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
	@Published var isLoading = false

	func getAppetizers() {
		isLoading = true
		NetworkManager.shared.getAppetizers { [self] result in
			DispatchQueue.main.async {
				self.isLoading = false
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
