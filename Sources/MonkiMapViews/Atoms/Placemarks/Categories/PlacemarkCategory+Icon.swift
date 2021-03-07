//
//  PlacemarkCategory+Icon.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 14/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel
import MonkiMapModel

extension Placemark.Category: WithIcon {
	
	public static var imageBundle: Bundle { .module }
	
	/// Icons from [Icons8](https://icons8.com)
	public var iconName: String? {
		switch self {
		case .unknown:
			return nil
		case .spot:
			return "icons8-place_marker"
		case .facility:
			return "icons8-school_building"
		case .miscellaneous:
			return "icons8-water"
		}
	}
	
}
