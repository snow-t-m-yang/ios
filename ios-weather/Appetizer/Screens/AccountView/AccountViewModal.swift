//
//  AccountViewModal.swift
//  ios-weather
//
//  Created by S on 2024/7/31.
//

import SwiftUI

final class AccountViewModal: ObservableObject {
	@Published var firstName = ""
	@Published var lastName = ""
	@Published var email = ""
	@Published var birthdate = Date()
	@Published var extraNapkins = false
	@Published var frequentRefills = false

	@Published var alertItem: APPAlertItem?

	var isValidForm: Bool {
		guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
			alertItem = APPAlertContext.invalidForm
			return false
		}

		guard email.isValidEmail else {
			alertItem = APPAlertContext.invalidEmail
			return false
		}

		return true
	}

	func saveChanges() {
		guard isValidForm else { return }

		print("saved")
	}
}
