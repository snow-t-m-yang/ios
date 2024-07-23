//
//  FrameworkDetailView.swift
//  ios-weather
//
//  Created by S on 2024/7/17.
//

import SwiftUI

struct FrameworkDetailView: View {
	var framework: Framework

//	@Binding var isShowingDetailView: Bool
	@State private var isShowingSafariView = false

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

			Button {
				isShowingSafariView = true
			} label: {
//				AFButton(title: "Learn More")
				Label("Learn More", systemImage: "book.fill")
			}
			.buttonStyle(.borderedProminent)
			.cornerRadius(30)
			.fullScreenCover(isPresented: $isShowingSafariView, content: {
				SafariView(url: URL(string: framework.urlString) ?? URL(string: "www.apple.com")!)
			})

//			HStack {
//				Spacer()
//
//				Button {
//					isShowingDetailView = false
//				} label: {
//					Image(systemName: "xmark")
//						.foregroundColor(Color(.label))
//						.imageScale(.large)
//						.frame(width: 44, height: 44, alignment: .center)
//				}
//			}
//			.padding(.horizontal)
		}
	}
}

// you have to build the preview by youself, em...
#Preview {
	FrameworkDetailView(framework: MockData.sampleFramework)
}
