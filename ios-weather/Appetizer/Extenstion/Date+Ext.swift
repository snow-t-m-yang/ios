//
//  Date+Ext.swift
//  ios-weather
//
//  Created by S on 2024/8/10.
//

import Foundation

extension Date {
	var eighteenYearAgo: Date {
		Calendar.current.date(
			byAdding: .year,
			value: -18,
			to: Date()
		)!
	}

	var oneHundredTenYearAgo: Date {
		Calendar.current.date(
			byAdding: .year,
			value: -110,
			to: Date()
		)!
	}
}
