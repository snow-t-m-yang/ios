//
//  FrameworkDetailView.swift
//  ios-weather
//
//  Created by S on 2024/7/17.
//

import SwiftUI

struct FrameworkDetailView: View {
	var framework: Framework

	var body: some View {
		VStack {
			Spacer()

			FrameworkTitleView(framework: framework)
			Text(framework.description)
				.font(.body)
				.fontDesign(.monospaced)
				.fontWeight(.bold)
				.padding()

			Spacer()

			Button {} label: {
				AFButton(title: "Learn More")
			}

			HStack {
				Spacer()

				Button {} label: {
					Image(systemName: "xmark")
						.foregroundColor(Color(.label))
						.imageScale(.large)
						.frame(width: 44, height: 44, alignment: .center)
				}
			}
			.padding(.horizontal)
		}
	}
}

// you have to build the preview by youself, em...
#Preview {
	FrameworkDetailView(framework: MockData.sampleFramework)
}
