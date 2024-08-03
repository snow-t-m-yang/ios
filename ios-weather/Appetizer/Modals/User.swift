//
//  User.swift
//  ios-weather
//
//  Created by S on 2024/8/2.
//

import Foundation

struct User: Codable {
	var firstName = ""
	var lastName = ""
	var email = ""
	var birthdate = Date()
	var extraNapkins = false
	var frequentRefills = false
}
