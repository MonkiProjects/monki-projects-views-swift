//
//  String+Transforms.swift
//  Common
//
//  Created by Rémi Bardon on 27/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public extension String {
	
	func asUsername() -> String {
		var username = self.lowercased().replacingOccurrences(of: " ", with: "_")
		
		// Remove prohibited characters
		let allowed = CharacterSet.usernameAllowed
		let set = { (char: Character) in CharacterSet(charactersIn: "\(char)") }
		username.removeAll(where: { allowed.isDisjoint(with: set($0)) })
		
		return username
	}
	
	func times(_ repetitions: Int, separator: String = "") -> String {
		return Array(repeating: self, count: repetitions).joined(separator: separator)
	}
	
}
