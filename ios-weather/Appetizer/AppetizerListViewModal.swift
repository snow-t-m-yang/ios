//
//  AppetizerListViewModal.swift
//  ios-weather
//
//  Created by S on 2024/7/25.
//

import SwiftUI

final class AppetizerListViewModal: ObservableObject {
	@Published var appetizers: [Appetizer] = []

	func getAppetizers() {
		NetworkManager.shared.getAppetizers { result in
			DispatchQueue.main.async {
				switch result {
				case .success(let appetizers):
					self.appetizers = appetizers
				case .failure(let error):
					print(error.localizedDescription)
				}
			}
		}
	}
}
