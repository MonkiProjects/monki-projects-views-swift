//
//  PlacemarkCategory+Icon.swift
//  MonkiMapViews
//
//  Created by Rémi Bardon on 14/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel
import MonkiMapModel

extension Placemark.Category.ID: WithIcon {
	
	public static var imageBundle: Bundle { .module }
	
	/// Icons from [Icons8](https://icons8.com)
	public var iconName: String? {
		switch self {
		case .unknown:
			return nil
		case .spot:
			return "icons8-place_marker-colored"
		case .facility:
			return "icons8-school_building-colored"
		case .miscellaneous:
			return "icons8-water-colored"
		}
	}
	
}
