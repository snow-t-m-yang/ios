//
//  AppetizerListView.swift
//  ios-weather
//
//  Created by S on 2024/7/24.
//

import SwiftUI

struct AppetizerListView: View {
	var body: some View {
		NavigationView {
			List(AMockData.appetizers) { app in
				HStack {
					Image("sf-symbols")
						.resizable()
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
			.navigationTitle("🍣 Appetizers")
		}
	}
}

#Preview {
	AppetizerListView()
}
