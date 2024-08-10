//
//  AccountView.swift
//  ios-weather
//
//  Created by S on 2024/7/24.
//

import SwiftUI

struct AccountView: View {
	@StateObject var viewModal = AccountViewModal()

	@FocusState private var focusedField: FormField?

	enum FormField {
		case firstName, lastName, email
	}

	var body: some View {
		NavigationView {
			Form {
				Section(header: Text("Personal Info")) {
					TextField(
						"First Name", text: $viewModal.user.firstName
					)
					.focused($focusedField, equals: .firstName)
					.onSubmit {
						focusedField = .lastName
					}
					.submitLabel(.next)

					TextField(
						"Last Name",
						text: $viewModal.user.lastName
					)
					.focused($focusedField, equals: .lastName)
					.onSubmit {
						focusedField = .email
					}
					.submitLabel(.next)

					TextField("Email", text: $viewModal.user.email)
						.focused($focusedField, equals: .email)
						.keyboardType(.emailAddress)
						.autocapitalization(.none)
						.autocorrectionDisabled(true)
						.onSubmit {
							focusedField = nil
						}
						.submitLabel(.continue)

//					DatePicker(
//						"Birthday",
//						selection: $viewModal.user.birthdate,
//						displayedComponents: .date
//					)

					DatePicker(
						"Birthday",
						selection: $viewModal.user.birthdate,
						in: Date().oneHundredTenYearAgo ... Date().eighteenYearAgo,
						displayedComponents: .date
					)

					Button {
						viewModal.saveChanges()
					} label: {
						Text("Save Changes")
					}
				}

				Section(header: Text("Requests")) {
					Toggle("Extra Napkins", isOn: $viewModal.user.extraNapkins)
					Toggle("Frequent Refills", isOn: $viewModal.user.frequentRefills)
				}
				.toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
			}
			.navigationTitle("Account")
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Button("Dismiss") {
						focusedField = nil
					}
				}
			}
		}
		.onAppear {
			viewModal.retriveUser()
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
