//
//  Color+Ext.swift
//  ios-weather
//
//  Created by S on 2024/7/29.
//

import SwiftUI

// swiftui color, not uikit
// we don't need this because the extension is created by xcode automatically!


//extension Color {
//	static let brandPrimary = Color("brandPrimary")
//}

//extension UIColor {
//	static let brandPrimary = UIColor(named: "brandPrimary")
//}

extension Data {
	
	func printJson() {
		do {
			let json = try JSONSerialization.jsonObject(with: self, options: [])
			let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
			guard let jsonString = String(data: data, encoding: .utf8) else {
				print("Inavlid data")
				return
			}
			print(jsonString)
		} catch {
			print("Error: \(error.localizedDescription)")
		}
	}
}
