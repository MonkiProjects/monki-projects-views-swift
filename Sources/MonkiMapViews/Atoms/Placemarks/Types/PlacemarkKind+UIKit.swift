//
//  PlacemarkKind+UIKit.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(UIKit)
import UIKit
import MonkiMapModel

public extension Placemark.Kind {
	
	@available(iOS 13.0, *)
	var uiColor: UIColor {
		Placemark.Category(for: self).uiColor
	}
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	func uiColor(placemarkState: Placemark.State) -> UIColor {
		Placemark.Category(for: self).uiColor(placemarkState: placemarkState)
	}
	
}
#endif
