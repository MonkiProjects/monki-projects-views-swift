//
//  PlaceUITheme.swift
//  MonkiMapViews
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import MonkiMapDTO
import Combine
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(UIKit)
import UIKit
#endif

public class PlaceUITheme: ObservableObject {
	
	public init() {}
	
	#if canImport(SwiftUI)
	// MARK: SwiftUI Colors
	
	open class var defaultColor: Color { .red }
	
	open class var draftColor: Color { .gray }
	
	public func colorForCategory(_ category: Place.Category.ID) -> Color { Self.defaultColor }
	
	public func colorForOptionalCategory(_ category: Place.Category.ID?) -> Color {
		if let category = category {
			return colorForCategory(category)
		} else {
			return Self.defaultColor
		}
	}
	
	public func color(forCategory category: Place.Category.ID?, isDraft: Bool) -> Color {
		isDraft ? Self.draftColor : self.colorForOptionalCategory(category)
	}
	
	public func color(forKind kind: Place.Kind.ID?, isDraft: Bool) -> Color {
		self.color(forCategory: kind?.category, isDraft: isDraft)
	}
	
	// MARK: SwiftUI Icons
	
	open class var defaultIcon: Image { Image(systemName: "mappin") }
	
	open class var draftIcon: Image { Image(systemName: "doc.text") }
	
	public func iconForKind(_ kind: Place.Kind.ID) -> Image { Self.defaultIcon }
	
	public func iconForOptionalKind(_ kind: Place.Kind.ID?) -> Image {
		if let kind = kind?.toValidCase {
			return iconForKind(kind)
		} else {
			return Self.defaultIcon
		}
	}
	
	public func icon(forKind kind: Place.Kind.ID?, isDraft: Bool) -> Image {
		isDraft ? Self.draftIcon : self.iconForOptionalKind(kind)
	}
	
	// MARK: SwiftUI Glyphs
	
	open class var defaultGlyph: Image { Self.defaultIcon }
	
	open class var draftGlyph: Image { Self.draftIcon }
	
	public func glyphForKind(_ kind: Place.Kind.ID) -> Image { Self.defaultGlyph }
	
	public func glyphForOptionalKind(_ kind: Place.Kind.ID?) -> Image {
		if let kind = kind?.toValidCase {
			return glyphForKind(kind)
		} else {
			return Self.defaultGlyph
		}
	}
	
	public func glyph(forKind kind: Place.Kind.ID?, isDraft: Bool) -> Image {
		isDraft ? Self.draftGlyph : self.glyphForOptionalKind(kind)
	}
	#endif
	
	#if canImport(UIKit)
	// MARK: UIKit Colors
	
	open class var defaultUiColor: UIColor { .systemRed }
	
	open class var draftUiColor: UIColor { .systemGray }
	
	public func uiColor(for category: Place.Category.ID) -> UIColor { Self.defaultUiColor }
	
	public func uiColor(for category: Place.Category.ID?) -> UIColor {
		if let category = category {
			return uiColor(for: category)
		} else {
			return Self.draftUiColor
		}
	}
	
	public func uiColor(for category: Place.Category.ID?, isDraft: Bool) -> UIColor {
		isDraft ? Self.draftUiColor : self.uiColor(for: category)
	}
	
	public func uiColor(forKind kind: Place.Kind.ID?, isDraft: Bool) -> UIColor {
		self.uiColor(for: kind?.category, isDraft: isDraft)
	}
	
	// MARK: UIKit Icons
	
	open class var defaultUiIcon: UIImage { UIImage(systemName: "mappin") ?? .init() }
	
	open class var draftUiIcon: UIImage { UIImage(systemName: "doc.text") ?? .init() }
	
	public func uiIcon(for kind: Place.Kind.ID) -> UIImage { Self.defaultUiIcon }
	
	public func uiIcon(for kind: Place.Kind.ID?) -> UIImage {
		if let kind = kind?.toValidCase {
			return uiIcon(for: kind)
		} else {
			return Self.defaultUiIcon
		}
	}
	
	public func uiIcon(for kind: Place.Kind.ID?, isDraft: Bool) -> UIImage {
		isDraft ? Self.draftUiIcon : self.uiIcon(for: kind)
	}
	
	// MARK: UIKit Glyphs
	
	open class var defaultUiGlyph: UIImage { Self.defaultUiIcon }
	
	open class var draftUiGlyph: UIImage { Self.draftUiIcon }
	
	public func uiGlyph(for kind: Place.Kind.ID) -> UIImage { Self.defaultUiGlyph }
	
	public func uiGlyph(for kind: Place.Kind.ID?) -> UIImage {
		if let kind = kind?.toValidCase {
			return uiGlyph(for: kind)
		} else {
			return Self.defaultUiGlyph
		}
	}
	
	public func uiGlyph(for kind: Place.Kind.ID?, isDraft: Bool) -> UIImage {
		isDraft ? Self.draftUiGlyph : self.uiGlyph(for: kind)
	}
	#endif
	
}

#if canImport(SwiftUI)
fileprivate struct PlaceUIThemeKey: EnvironmentKey {
	
	static let defaultValue: PlaceUITheme = .default
	
}

extension EnvironmentValues {
	
	public var placeUiTheme: PlaceUITheme {
		get { self[PlaceUIThemeKey.self] }
		set { self[PlaceUIThemeKey.self] = newValue }
	}
	
}
#endif
