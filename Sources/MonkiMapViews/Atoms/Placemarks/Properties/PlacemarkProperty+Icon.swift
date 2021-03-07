//
//  PlacemarkProperty+Icon.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 14/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel
import MonkiMapModel

extension Placemark.Property: WithIcon {
	
	public static var imageBundle: Bundle { .module }
	
	/// Icons from [Icons8](https://icons8.com)
	public var iconName: String? {
		guard let url = Bundle.module.url(forResource: "PlacemarkPropertyIcons", withExtension: "json"),
			  let data = try? Data(contentsOf: url),
			  let map = try? JSONDecoder().decode([String: [String: String]].self, from: data)
		else { return nil }
		
		return map[self.kind.rawValue]?[self.id]
	}
	
}
