//
//  BarcodeView.swift
//  ios-weather
//
//  Created by S on 2024/7/18.
//

import SwiftUI

struct BarcodeView: View {
	
	@State private var scannedCode = ""
	
	
	var body: some View {
		NavigationView {
			VStack {
				ScannerView(scannedCode: $scannedCode)
					.frame(maxWidth: .infinity, maxHeight: 300)

				Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
					.font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)

				Text(scannedCode.isEmpty ? "No" : scannedCode)
					.bold()
					.font(.largeTitle)
					.foregroundColor(scannedCode.isEmpty ? .red : .green)
					.padding()
			}
			.navigationTitle("Barcode Scanner")
		}
	}
}

#Preview {
	BarcodeView()
}
