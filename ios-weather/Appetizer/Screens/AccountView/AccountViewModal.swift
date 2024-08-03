//
//  AccountViewModal.swift
//  ios-weather
//
//  Created by S on 2024/7/31.
//

import SwiftUI

final class AccountViewModal: ObservableObject {
	@AppStorage("user") private var userData: Data?
	@Published var user = User()
	@Published var alertItem: APPAlertItem?

	func saveChanges() {
		guard isValidForm else { return }

		do {
			let data = try JSONEncoder().encode(user)
			userData = data
			debugPrint(userData!)
			alertItem = APPAlertContext.userSaveSuccess
		} catch {
			alertItem = APPAlertContext.invalidUserData
		}
	}

	func retriveUser() {
		guard let userData = userData else {return}
		
		do {
			user = try JSONDecoder().decode(User.self, from: userData)
			debugPrint(user)
		} catch {
			alertItem = APPAlertContext.invalidUserData
		}
	}

	var isValidForm: Bool {
		guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
			alertItem = APPAlertContext.invalidForm
			return false
		}

		guard user.email.isValidEmail else {
			alertItem = APPAlertContext.invalidEmail
			return false
		}

		return true
	}
}
