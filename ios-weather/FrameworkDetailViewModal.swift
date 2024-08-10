//
//  FrameworkDetailViewModal.swift
//  ios-weather
//
//  Created by S on 2024/8/8.
//

import SwiftUI

final class FrameworkDetailViewModal: ObservableObject {
	let framework: Framework
	var isShowingDetailView: Binding<Bool>
	@Published var isShowingSafariView = false

	init(framework: Framework, isShowingDetailView: Binding<Bool>) {
		self.framework = framework
		self.isShowingDetailView = isShowingDetailView
	}
}
