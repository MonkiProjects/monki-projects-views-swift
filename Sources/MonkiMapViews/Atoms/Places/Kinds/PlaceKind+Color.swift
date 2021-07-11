//
//  PlaceKind+Color.swift
//  MonkiMapViews
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import MonkiMapModel
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(UIKit)
import UIKit
#endif

public extension Place.Kind.ID {
	
	#if canImport(SwiftUI)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	var color: Color {
		Place.Category.ID(for: self).color
	}
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	func color(placeState: Place.State) -> Color {
		Place.Category.ID(for: self).color(placeState: placeState)
	}
	#endif
	
	#if canImport(UIKit)
	@available(iOS 13.0, *)
	var uiColor: UIColor {
		Place.Category(for: self).uiColor
	}
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	func uiColor(placeState: Place.State) -> UIColor {
		Place.Category(for: self).uiColor(placeState: placeState)
	}
	#endif
	
}
