//
//  Order.swift
//  ios-weather
//
//  Created by S on 2024/8/3.
//

import SwiftUI

final class Order: ObservableObject {
	@Published var items: [Appetizer] = []

	var totalPrice: Double {
		items.reduce(0) {
			$0 + $1.price
		}
	}

	func add(_ appetizer: Appetizer) {
		items.append(appetizer)
	}

	func delete(at offetsets: IndexSet) {
		items.remove(atOffsets: offetsets)
	}
}
