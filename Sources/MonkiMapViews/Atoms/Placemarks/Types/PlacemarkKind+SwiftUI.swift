//
//  PlacemarkKind+SwiftUI.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI
import MonkiMapModel

public extension Placemark.Kind {
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	var color: Color {
		Placemark.Category(for: self).color
	}
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	func color(placemarkState: Placemark.State) -> Color {
		Placemark.Category(for: self).color(placemarkState: placemarkState)
	}
	
}
#endif
