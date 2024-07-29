//
//  AppetizerTabView.swift
//  ios-weather
//
//  Created by S on 2024/7/24.
//

import SwiftUI

struct AppetizerTabView: View {
	var body: some View {
		TabView {
			AppetizerListView()
				.tabItem {
					Image(systemName: "house")
				}
			AccountView()
				.tabItem {
					Image(systemName: "person")
				}
			OrderView()
				.tabItem {
					Image(systemName: "bag")
				}
		}
		.accentColor(Color(.brandPrimary))
	}
}

#Preview {
	AppetizerTabView()
}
