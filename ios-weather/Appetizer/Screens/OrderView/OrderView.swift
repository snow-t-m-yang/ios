//
//  OrderView.swift
//  ios-weather
//
//  Created by S on 2024/7/24.
//

import SwiftUI

struct OrderView: View {
	@EnvironmentObject var order: Order

	var body: some View {
		NavigationView {
			ZStack {
				VStack {
					List {
						ForEach(order.items) { appetizer in
							AppetizerListCell(app: appetizer)
						}
						.onDelete(perform: order.delete)
					}
					.listStyle(PlainListStyle())

					Button {} label: {
						AFButton(title: "$ \(order.totalPrice, specifier: "%.2f")")
					}
					.padding(.bottom, 30)
				}

				if order.items.isEmpty {
					EmptyState(imageName: "book.pages", message: "No item in your order. \nplease add one!")
				}
			}
			.navigationTitle("Order")
		}
	}
}

#Preview {
	OrderView()
}
