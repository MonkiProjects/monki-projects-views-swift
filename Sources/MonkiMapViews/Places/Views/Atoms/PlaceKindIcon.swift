//
//  PlaceKindIcon.swift
//  MonkiMapViews
//
//  Created by Rémi Bardon on 25/07/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI
import MonkiMapDTO

public struct PlaceKindIcon: View {
	
	public typealias Kind = Place.Kind.ID
	
	@Environment(\.placeUiTheme) private var placeUiTheme
	
	private let kind: Kind?
	private let isDraft: Bool
	
	public init(for kind: Kind?, isDraft: Bool = false) {
		self.kind = kind
		self.isDraft = isDraft
	}
	
	public var body: some View {
		GeometryReader { geo in
			let size = min(geo.size.width, geo.size.height)
			let iconSize = iconSize(for: size)
			ZStack {
				Circle()
					.fill(color)
					.frame(width: size, height: size)
				icon(size: size)
					.resizable()
					.scaledToFit()
					.font(.system(size: iconSize))
					.frame(width: iconSize, height: iconSize)
					.foregroundColor(.white)
			}
		}
	}
	
	private func iconSize(for size: CGFloat) -> CGFloat { size * 3 / 5 }
	
	private var color: Color {
		placeUiTheme.color(forKind: kind, isDraft: isDraft)
	}
	
	private func icon(size: CGFloat) -> Image {
		if size > 36 {
			return placeUiTheme.icon(forKind: kind, isDraft: isDraft)
		} else {
			return placeUiTheme.glyph(forKind: kind, isDraft: isDraft)
		}
	}
	
}

extension PlaceKindIcon {
	
	public init(for place: Place.DTO.Public) {
		self.init(for: place.kind, isDraft: place.metadata.isDraft)
	}
	
}

internal struct PlaceKindIcon_Previews: PreviewProvider {
	
	private struct IconPreview: View {
		
		let kind: Place.Kind.ID?
		let isDraft: Bool
		let size: CGFloat
		
		var body: some View {
			VStack {
				PlaceKindIcon(for: kind, isDraft: isDraft)
					.frame(width: size, height: size)
				Text(kind?.rawValue ?? "nil")
					.font(.caption)
					.multilineTextAlignment(.center)
			}
		}
		
	}
	
	private struct Preview: View {
		
		static let largeSize: CGFloat = 72
		static let smallSize: CGFloat = 32
		static let spacing: CGFloat = 16
		
		let isDraft: Bool
		
		init(isDraft: Bool = false) {
			self.isDraft = isDraft
		}
		
		var body: some View {
			ScrollView {
				LazyVGrid(
					columns: [GridItem(.adaptive(minimum: Self.largeSize, maximum: Self.largeSize), spacing: Self.spacing, alignment: .top)],
					spacing: Self.spacing
				) {
					ForEach(Place.Kind.ID.allCases) { kind in
						IconPreview(kind: kind, isDraft: isDraft, size: Self.largeSize)
					}
					IconPreview(kind: nil, isDraft: isDraft, size: Self.largeSize)
					ForEach(Place.Kind.ID.allCases) { kind in
						IconPreview(kind: kind, isDraft: isDraft, size: Self.smallSize)
					}
					IconPreview(kind: nil, isDraft: isDraft, size: Self.smallSize)
				}
				.padding(8)
			}
		}
		
	}
	
	static var previews: some View {
		Preview(isDraft: false)
		Preview(isDraft: true)
	}
	
}
