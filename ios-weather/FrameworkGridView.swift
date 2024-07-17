//
//  ContentView.swift
//  ios-weather
//
//  Created by S on 2024/7/15.
//

import SwiftUI

struct FrameworkGridView: View {
	let cols: [GridItem] = [GridItem(.flexible()),
	                        GridItem(.flexible()),
	                        GridItem(.flexible())]

	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: cols) {
					ForEach(MockData.frameworks) { framework in
						FrameworkTitleView(framework: framework)
					}
				}
			}
			.navigationTitle("Frameworks")
		}
	}
}

#Preview {
	FrameworkGridView()
}

struct FrameworkTitleView: View {
	let framework: Framework

	var body: some View {
		VStack {
			Image(framework.imageName)
				.resizable()
				.frame(width: 90, height: 90)
			Text(framework.name)
				.font(.title2)
				.fontWeight(.semibold)
				.scaledToFit()
				.minimumScaleFactor(0.6)
		}
		.padding()
	}
}
