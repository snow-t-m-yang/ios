//
//  SafariView.swift
//  ios-weather
//
//  Created by S on 2024/7/18.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
	let url: URL

	func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
		SFSafariViewController(url: url)
	}

	func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
