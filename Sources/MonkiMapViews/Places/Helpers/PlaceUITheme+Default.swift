//
//  PlaceUITheme+Default.swift
//  MonkiMapViews
//
//  Created by Rémi Bardon on 18/12/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(UIKit)
import UIKit
#endif
import MonkiMapDTO

extension PlaceUITheme {
	
	public static var `default`: PlaceUITheme { DefaultTheme() }
	
	fileprivate final class DefaultTheme: PlaceUITheme {
		
		#if canImport(SwiftUI)
		override func colorForCategory(_ category: Place.Category.ID) -> Color {
			Color("place-categories/\(category.rawValue)", bundle: .module)
		}
		
		override func iconForKind(_ kind: Place.Kind.ID) -> Image {
			Image("place-kinds/\(kind.rawValue)", bundle: .module)
		}
		
		override func glyphForKind(_ kind: Place.Kind.ID) -> Image {
			Image("place-kinds/\(kind.rawValue)-glyph", bundle: .module)
		}
		#endif
		
		#if canImport(UIKit)
		override func uiColor(for id: Place.Category.ID) -> UIColor {
			UIColor(named: "place-categories/\(id.rawValue)", in: .module, compatibleWith: nil) ?? Self.defaultUiColor
		}
		
		override func uiIcon(for kind: Place.Kind.ID) -> UIImage {
			UIImage(named: "place-kinds/\(kind.rawValue)", in: .module, compatibleWith: nil) ?? Self.defaultUiIcon
		}
		
		override func uiGlyph(for kind: Place.Kind.ID) -> UIImage {
			UIImage(named: "place-kinds/\(kind.rawValue)-glyph", in: .module, compatibleWith: nil) ?? Self.defaultUiGlyph
		}
		#endif
		
	}
	
}
