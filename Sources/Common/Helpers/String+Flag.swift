//
//  String+Flag.swift
//  Common
//
//  Created by Rémi Bardon on 28/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation
import SwiftFlags

public enum Flag {
	
	private static let `default` = "🏳️"
	
	private static let cache = NSCache<NSString, NSString>()
	
	public static func of(_ country: String?) -> String {
		guard let country = country else { return `default` }
		
		if let cached = cache.object(forKey: country as NSString) {
			return cached as String
		} else {
			let flag = SwiftFlags.flag(for: country) ?? `default`
			cache.setObject(flag as NSString, forKey: country as NSString)
			return flag
		}
	}
	
}
