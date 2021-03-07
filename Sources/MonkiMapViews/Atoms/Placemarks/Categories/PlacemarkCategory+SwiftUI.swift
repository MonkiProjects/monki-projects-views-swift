//
//  PlacemarkCategory+SwiftUI.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI
import MonkiMapModel

public extension Placemark.Category {
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	var color: Color { Color(rawValue, bundle: .module) }
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	func color(placemarkState: Placemark.State) -> Color {
		if placemarkState.isLocal {
			return .gray
		} else {
			return self.color
		}
	}
	
}
#endif
