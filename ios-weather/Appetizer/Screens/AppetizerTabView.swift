//
//  AppetizerTabView.swift
//  ios-weather
//
//  Created by S on 2024/7/24.
//

import SwiftUI

struct AppetizerTabView: View {
	@EnvironmentObject var order: Order

	var body: some View {
		TabView {
			AppetizerListView()
				.tabItem {
					Image(systemName: "Home")
				}
			AccountView()
				.tabItem {
					Image(systemName: "person")
				}
			OrderView()
				.tabItem {
					Image(systemName: "bag")
				}
				.badge(order.items.count)
		}
	}
}

// #Preview {
//	AppetizerTabView()
// }
