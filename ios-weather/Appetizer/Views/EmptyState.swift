//
//  EmptyState.swift
//  ios-weather
//
//  Created by S on 2024/8/3.
//

import SwiftUI

struct EmptyState: View {
	let imageName: String
	let message: String
	
	var body: some View {
		ZStack {
			Color(.systemBackground)
				.ignoresSafeArea(.all)
			VStack {
				Image(systemName: imageName)
					.resizable()
					.scaledToFit()
					.frame(height: 150, alignment: .center)
					.foregroundColor(.pink)
				
				Text(message)
					.font(.title3)
					.fontWeight(.semibold)
					.multilineTextAlignment(.center)
					.foregroundColor(.secondary)
					.padding()
					
			}
			.offset(y: -50)
		}
	}
}

#Preview {
	EmptyState(imageName: "book.pages", message: "testing text")
}
