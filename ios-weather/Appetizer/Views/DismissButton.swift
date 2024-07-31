//
//  DismissButton.swift
//  ios-weather
//
//  Created by S on 2024/7/31.
//

import SwiftUI

struct DismissButton: View {
	var body: some View {
		ZStack {
			Circle()
				.frame(width: 30, height: 30)
				.foregroundColor(.white)
				.opacity(0.6)
			Image(systemName: "xmark")
				.imageScale(.small)
				.frame(width: 44, height: 44, alignment: .center)
				.foregroundColor(.black)
		}
	}
}

#Preview {
	DismissButton()
}
