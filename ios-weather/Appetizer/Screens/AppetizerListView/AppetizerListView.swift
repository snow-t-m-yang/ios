//
//  AppetizerListView.swift
//  ios-weather
//
//  Created by S on 2024/7/24.
//

import SwiftUI

struct AppetizerListView: View {
	@StateObject var viewModal = AppetizerListViewModal()
	@State private var isShowingDetail = false
	@State private var selectedAppetizer: Appetizer?
	
	var body: some View {
		ZStack {
			NavigationView {
				List(viewModal.appetizers) { app in
					AppetizerListCell(app: app)
						.onTapGesture {
							selectedAppetizer = app
							isShowingDetail = true
						}
				}
				.navigationTitle("🍣 Appetizers")
				.disabled(isShowingDetail)
			}
			.onAppear {
				viewModal.getAppetizers()
			}
			.blur(radius: isShowingDetail ? 20 : 0)
			
			if isShowingDetail {
				AppetizerDetailView(apptizer: selectedAppetizer!, isShowingDetail: $isShowingDetail)
			}

			if viewModal.isLoading {
				LoadingView()
			}

		}.alert(item: $viewModal.appAlertItem) { appAlertItem in
			Alert(
				title: appAlertItem.title,
				message: appAlertItem.message,
				dismissButton: appAlertItem.dismissButton
			)
		}
	}
}

#Preview {
	AppetizerListView()
}

struct AppetizerListCell: View {
	let app: Appetizer

	var body: some View {
		HStack {
			AppetizerRemoteImage(urlString: app.imageURL)
				.aspectRatio(contentMode: .fit)
				.frame(width: 120, height: 90)
				.cornerRadius(9)

			VStack(alignment: .leading, spacing: 5) {
				Text(app.name)
					.font(.title2)
					.fontWeight(.medium)
				Text("$\(app.price, specifier: "%.2f")")
					.foregroundColor(.secondary)
					.fontWeight(.semibold)
			}
			.padding(.leading)
		}
	}
}
