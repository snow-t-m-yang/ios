//
//  AFButton.swift
//  ios-weather
//
//  Created by S on 2024/7/17.
//

import SwiftUI

struct AFButton: View {
	var title: String

	var body: some View {
		Text(title)
			.font(.body)
			.fontDesign(.monospaced)
			.fontWeight(.semibold)
			.frame(width: 280, height: 50)
			.background(Color.blue)
			.foregroundColor(Color.white)
			.cornerRadius(30)
	}
}

#Preview {
	AFButton(title: "Preview")
}
