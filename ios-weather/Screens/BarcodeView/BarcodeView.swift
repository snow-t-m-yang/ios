//
//  BarcodeView.swift
//  ios-weather
//
//  Created by S on 2024/7/18.
//

import SwiftUI

struct BarcodeView: View {
//	@State private var isShowingAlert = false
	@StateObject var viewModal = BarcodeScannerViewModal()

	var body: some View {
		NavigationView {
			VStack {
				ScannerView(scannedCode: $viewModal.scannedCode, alertItem: $viewModal.alertItem)
					.frame(maxWidth: .infinity, maxHeight: 300)

				Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
					.font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)

				Text(viewModal.statusText)
					.bold()
					.font(.largeTitle)
					.foregroundColor(viewModal.statusTextColor)
					.padding()

//				Button {
//					isShowingAlert = true
//				} label: {
//					Text("I want to be a iOS dev")
//				}
			}
			.navigationTitle("Barcode Scanner")
			// you can only use one alert
			.alert(item: $viewModal.alertItem) { alertItem in
				Alert(title: Text(alertItem.title),
				      message: Text(alertItem.message),
				      dismissButton: alertItem.dismissButton)
			}
//			.alert(isPresented: $isShowingAlert, content: {
//				Alert(title: Text("Try harder"), message: Text("Yes"), dismissButton: .default(Text("You are canclled")))
//			})
		}
	}
}

#Preview {
	BarcodeView()
}
