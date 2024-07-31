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

	var isValidForm: Bool {
		guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
			return false
		}

		guard email.isValidEmail else {
			return false
		}

			return true
	}
}
