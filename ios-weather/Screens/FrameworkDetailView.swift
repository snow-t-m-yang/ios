//
//  FrameworkDetailView.swift
//  ios-weather
//
//  Created by S on 2024/7/17.
//

import SwiftUI

struct FrameworkDetailView: View {
	@ObservedObject var viewModal: FrameworkDetailViewModal

	var body: some View {
		VStack {
			Spacer()

			FrameworkTitleView(framework: viewModal.framework)
			Text(viewModal.framework.description)
				.font(.body)
				.fontDesign(.monospaced)
				.fontWeight(.bold)
				.padding()

			Spacer()

//			Link(destination: URL(string: viewModal.framework.urlString) ?? URL(string: "www.apple.com")!) {
//				AFButton(title: "Learn More")
//			}

			Button {
				viewModal.isShowingSafariView = true
			} label: {
				//				AFButton(title: "Learn More")
				Label("Learn More", systemImage: "book.fill")
			}
			.buttonStyle(.borderedProminent)
			.cornerRadius(30)
			.fullScreenCover(isPresented: $viewModal.isShowingSafariView, content: {
				SafariView(url: URL(string: viewModal.framework.urlString) ?? URL(string: "www.apple.com")!)
			})

			Spacer()

			Button {
				viewModal.isShowingDetailView.wrappedValue = false
			} label: {
				Image(systemName: "xmark")
					.foregroundColor(Color(.label))
					.imageScale(.large)
					.frame(width: 44, height: 44, alignment: .center)
			}

			.padding(.horizontal)
		}
	}
}

// you have to build the preview by yourself, em...
#Preview {
	FrameworkDetailView(
		viewModal: FrameworkDetailViewModal(
			framework: MockData.sampleFramework,
			isShowingDetailView: .constant(
				false
			)
		)
	)
}
