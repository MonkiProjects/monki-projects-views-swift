//
//  PlacemarkKind+Icon.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 14/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiProjectsModel
import MonkiMapModel

extension Placemark.Kind: WithIcon, WithGlyph {
	
	public static var imageBundle: Bundle { .module }
	
	/// Icons from [Icons8](https://icons8.com)
	public var iconName: String? {
		switch self {
		case .unknown:
			return "icons8-map_pin"
		case .trainingSpot, .outdoorParkourPark:
			return "icons8-trainers"
		case .calisthenicsPark:
			return "icons8-pullups"
		case .descent:
			return "icons8-height"
		case .urbanClimbingSpot:
			return "icons8-chalk_bag"
		case .playground:
			return "icons8-playground"
		case .indoorParkourPark:
			return "icons8-facility"
		case .boulderingFacility:
			return "icons8-climbing"
		case .aomAcademy:
			return "icons8-facility"
		case .trickingSchool:
			return "icons8-tricking"
		case .trampolinePark:
			return "icons8-trampoline_park"
		case .gymnasticsGym:
			return "icons8-gymnastics"
		case .drinkingFountain:
			return "icons8-drinking_fountain"
		case .bikeRental:
			return "icons8-bicycle"
		}
	}
	
	/// Icons from [Icons8](https://icons8.com)
	public var glyphName: String? { iconName?.appending("-glyph") }
	
}
