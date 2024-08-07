//
//  AppetizerListViewModal.swift
//  ios-weather
//
//  Created by S on 2024/7/25.
//

import SwiftUI

@MainActor final class AppetizerListViewModal: ObservableObject {
	@Published var appetizers: [Appetizer] = []
	@Published var appAlertItem: APPAlertItem?
	@Published var isLoading = false
	@Published var isShowingDetail = false
	@Published var selectedAppetizer: Appetizer?

//	func getAppetizers() {
//		isLoading = true
//		NetworkManager.shared.getAppetizers { [self] result in
//			DispatchQueue.main.async {
//				self.isLoading = false
//				switch result {
//				case .success(let appetizers):
//					self.appetizers = appetizers
//				case .failure(let error):
//					switch error {
//					case .invalidResponse:
//						self.appAlertItem = APPAlertContext.invalidResponse
//
//					case .invalidData:
//						self.appAlertItem = APPAlertContext.invalidData
//
//					case .invalidURL:
//						self.appAlertItem = APPAlertContext.invalidURL
//
//					case .unableToComplete:
//					self.appAlertItem = APPAlertContext.unableToComplete
//					}
//				}
//			}
//		}
//	}

	func getAppetizers() {
		isLoading = true

		Task {
			do {
				appetizers = try await NetworkManager.shared.getAppetizers()

			} catch {
				if let apError = error as? APError {
					switch apError {
					case .invalidURL:
						appAlertItem = APPAlertContext.invalidURL
					case .invalidResponse:
						appAlertItem = APPAlertContext.invalidResponse
					case .invalidData:
						appAlertItem = APPAlertContext.invalidData
					case .unableToComplete:
						appAlertItem = APPAlertContext.unableToComplete
					}
				} else {
					appAlertItem = APPAlertContext.invalidResponse
				}
			}

			isLoading = false
		}
	}
}
