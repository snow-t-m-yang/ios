//
//  APError.swift
//  ios-weather
//
//  Created by S on 2024/7/24.
//

import Foundation

enum APError: Error {
	case invalidURL
	case invalidResponse
	case invalidData
	case unableToComplete
}
