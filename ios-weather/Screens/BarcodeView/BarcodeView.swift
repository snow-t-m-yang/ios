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
			VStack{
				Rectangle()
					.frame(maxWidth: .infinity, maxHeight: 300)
			}
			.navigationTitle("Barcode Scanner")
		}
	}
}

#Preview {
	BarcodeView()
}
