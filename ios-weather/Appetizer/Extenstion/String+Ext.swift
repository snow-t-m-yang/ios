//
//  String+Ext.swift
//  ios-weather
//
//  Created by S on 2024/7/31.
//

import Foundation
import RegexBuilder

extension String {
	var isValidEmail: Bool {
		let emailRegex = Regex {
			OneOrMore {
				CharacterClass(
					.anyOf("._%+-"),
					("A"..."Z"),
					("0"..."9"),
					("a"..."z")
				)
			}
			"@"
			OneOrMore {
				CharacterClass(
					.anyOf("._"),
					("A"..."Z"),
					("a"..."z"),
					("0"..."9")
				)
			}
			"."
			Repeat(2...64) {
				CharacterClass(
					("A"..."Z"),
					("a"..."z")
				)
			}
		}

		return (self.wholeMatch(of: emailRegex) != nil)
	}
}
