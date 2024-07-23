//
//  BarcodeView.swift
//  ios-weather
//
//  Created by S on 2024/7/18.
//

import SwiftUI

struct BarcodeView: View {
	var body: some View {
		NavigationView {
			VStack {
				Rectangle()
					.frame(maxWidth: .infinity, maxHeight: 300)

				Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
					.font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)

				Text("No")
					.bold()
					.font(.largeTitle)
					.foregroundColor(.green)
					.padding()
			}
			.navigationTitle("Barcode Scanner")
		}
	}
}

#Preview {
	BarcodeView()
}
