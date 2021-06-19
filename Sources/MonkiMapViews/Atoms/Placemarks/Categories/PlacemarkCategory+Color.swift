//
//  PlacemarkCategory+Color.swift
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

public extension Placemark.Category.ID {
	
	#if canImport(SwiftUI)
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
	#endif
	
	#if canImport(UIKit)
	@available(iOS 11.0, *)
	public var uiColor: UIColor { UIColor(named: rawValue, in: .module, compatibleWith: nil) ?? .systemRed }
	
	@available(iOS 11.0, *)
	public func uiColor(placemarkState: Placemark.State) -> UIColor {
		if placemarkState.isLocal {
			return .systemGray
		} else {
			return self.uiColor
		}
	}
	#endif
	
}
