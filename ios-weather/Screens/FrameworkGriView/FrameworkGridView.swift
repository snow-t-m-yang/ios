//
//  ContentView.swift
//  ios-weather
//
//  Created by S on 2024/7/15.
//

import SwiftUI

struct FrameworkGridView: View {
	@StateObject var viewModel = FrameworkGridViewModal()

	let cols: [GridItem] = [GridItem(.flexible()),
	                        GridItem(.flexible()),
	                        GridItem(.flexible())]

	var body: some View {
		NavigationStack {
			ScrollView {
				LazyVGrid(columns: cols) {
					ForEach(MockData.frameworks) { framework in
						NavigationLink(value: framework) {
							FrameworkTitleView(framework: framework)
								.onTapGesture {
									viewModel.selectedFramework = framework
								}
						}
					}
				}
			}
			.navigationTitle("Frameworks")
//			.navigationDestination(for: Framework.self) { framework in
//				FrameworkDetailView(viewModal: FrameworkDetailViewModal(framework: viewModel.selectedFramework!, isShowingDetailView: viewModel.$isShowingDetailView))
//			}
			.sheet(isPresented: $viewModel.isShowingDetailView) {
				FrameworkDetailView(
					viewModal: FrameworkDetailViewModal(
						framework: viewModel.selectedFramework!,
						isShowingDetailView: $viewModel.isShowingDetailView
					)
				)
				.presentationBackground(.thinMaterial)
			}
		}
	}
}

#Preview {
	FrameworkGridView()
}
