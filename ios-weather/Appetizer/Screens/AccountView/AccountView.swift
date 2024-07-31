//
//  AccountView.swift
//  ios-weather
//
//  Created by S on 2024/7/24.
//

import SwiftUI

struct AccountView: View {
	@StateObject var viewModal = AccountViewModal()

	var body: some View {
		NavigationView {
			Form {
				Section(header: Text("Personal Info")) {
					TextField("First Name", text: $viewModal.firstName)
					TextField("Last Name", text: $viewModal.lastName)
					TextField("Email", text: $viewModal.email)
						.keyboardType(.emailAddress)
						.autocapitalization(.none)
						.autocorrectionDisabled(true)

					DatePicker("Birthday", selection: $viewModal.birthdate, displayedComponents: .date)

					Button {
						viewModal.saveChanges()
					} label: {
						Text("Save Changes")
					}
				}

				Section(header: Text("Requests")) {
					Toggle("Extra Napkins", isOn: $viewModal.extraNapkins)
					Toggle("Frequent Refills", isOn: $viewModal.frequentRefills)
				}
				.toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
			}
			.navigationTitle("Account")
		}
		.alert(item: $viewModal.alertItem) { aletItem in
			Alert(
				title: aletItem.title,
				message: aletItem.message,
				dismissButton: aletItem.dismissButton
			)
		}
	}
}

#Preview {
	AccountView()
}