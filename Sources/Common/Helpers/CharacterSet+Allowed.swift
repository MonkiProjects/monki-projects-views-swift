//
//  CharacterSet+Ext.swift
//  Common
//
//  Created by Rémi Bardon on 22/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation

public extension CharacterSet {
	
	/// `[a-z0-9._]`
	static var usernameAllowed: CharacterSet {
		return lowercaseLetters					// [a-z]
			.union(.decimalDigits)				// [0-9]
			.union(.init(charactersIn: "._"))	// [._]
	}
	
}
