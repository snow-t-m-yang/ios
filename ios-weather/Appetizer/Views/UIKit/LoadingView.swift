//
//  LoadingView.swift
//  ios-weather
//
//  Created by S on 2024/7/29.
//

import SwiftUI

struct ActivityIndicatior: UIViewRepresentable {
	func makeUIView(context: Context) -> UIActivityIndicatorView {
		let activityIndicatorView = UIActivityIndicatorView(style: .large)
		activityIndicatorView.color = UIColor.brandPrimary
		activityIndicatorView.startAnimating()
		return activityIndicatorView
	}
	
	func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
}

struct LoadingView: View {
	var body: some View {
		ZStack {
			Color(.systemBackground)
				// fill the entire screen
				.ignoresSafeArea(.all)
			
//			ActivityIndicatior()
			ProgressView()
				.progressViewStyle(
					CircularProgressViewStyle(
						tint: .brandPrimary
					)
				)
				.scaleEffect(2)
		}
	}
}
