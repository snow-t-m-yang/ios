//
//  ios_weatherApp.swift
//  ios-weather
//
//  Created by S on 2024/7/15.
//

import SwiftUI

@main
struct root: App {
	
	var order  = Order()
	
    var body: some Scene {
        WindowGroup {
//			FrameworkGridView()
//			BarcodeView()
			AppetizerTabView().environmentObject(order)
        }
    }
}
