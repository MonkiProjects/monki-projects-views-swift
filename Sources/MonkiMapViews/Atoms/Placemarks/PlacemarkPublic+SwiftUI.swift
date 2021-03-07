//
//  PlacemarkPublic+SwiftUI.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI
import MonkiMapModel

extension Placemark.Public {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var icon: Image? {
		#if !os(macOS)
		if state == .draft {
			return Image(systemName: "doc.text")
		}
		#endif
		
		return self.kind.icon
	}
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var glyph: Image? {
		#if !os(macOS)
		if state == .draft {
			return Image(systemName: "doc.text")
		}
		#endif
		
		return self.kind.glyph
	}
	
	@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
	public var color: Color? {
		return self.category.color(placemarkState: state)
	}
	
}
#endif
