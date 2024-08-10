//
//  FrameworkGridViewModal.swift
//  ios-weather
//
//  Created by S on 2024/7/18.
//

import SwiftUI

// first test of MVVM!
final class FrameworkGridViewModal: ObservableObject {
	var selectedFramework: Framework? {
		didSet {
			isShowingDetailView = true
		}
	}

	@Published var isShowingDetailView = false
}
