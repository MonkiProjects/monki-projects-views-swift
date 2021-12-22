//
//  PlaceDetailsHeader.swift
//  MonkiMapViews
//
//  Created by Rémi Bardon on 30/07/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI
import MonkiMapDTO

public struct PlaceDetailsHeader: View {
	
	private static let iconSize: CGFloat = 48
	
	private let model: Model
	
	public init(model: Model) {
		self.model = model
	}
	
	public var body: some View {
		HStack(spacing: 8) {
			PlaceKindIcon(for: model.placeKind, isDraft: model.placeIsDraft)
				.frame(width: Self.iconSize, height: Self.iconSize)
			VStack(alignment: .leading, spacing: 2) {
				placeName()
					.font(.headline)
				kindLabel()
					.font(.subheadline)
					.foregroundColor(.secondary)
			}
			Spacer()
		}
	}
	
	private func placeName() -> Text {
		let name: String = {
			if let name = model.placeName, !name.isEmpty {
				return name
			} else {
				return "Unnamed place"
			}
		}()
		
		return Text(name)
	}
	
	@ViewBuilder
	private func kindLabel() -> some View {
		if let kind = model.placeKind {
			let title = kind.optionalTitle() ?? kind.rawValue
			
			Text(title)
				.accessibilityElement()
				.accessibility(identifier: "kind")
//				.accessibility(label: Text(i18n.placeKindAccessibilityLabel(name: title)))
		}
	}
	
}

extension PlaceDetailsHeader {
	
	public struct Model {
		
		public let placeName: Place.Name?
		public let placeKind: Place.Kind.ID?
		public let placeIsDraft: Bool
		
		public init(name: Place.Name?, kind: Place.Kind.ID?, isDraft: Bool = false) {
			self.placeName = name
			self.placeKind = kind
			self.placeIsDraft = isDraft
		}
		
	}
	
}

import LoremSwiftum

internal struct PlaceDetailsHeader_Previews: PreviewProvider {
	
	private struct Preview<Content: View>: View {
		
		@ViewBuilder let views: () -> Content
		
		var body: some View {
			List {
				views()
					.padding(.vertical, 4)
			}
			.listStyle(.plain)
		}
		
	}
	
	static var previews: some View {
		Preview {
			PlaceDetailsHeader(model: .init(name: Lorem.title, kind: nil))
			PlaceDetailsHeader(model: .init(name: nil, kind: .trainingSpot))
			PlaceDetailsHeader(model: .init(name: "", kind: .outdoorParkourPark))
			PlaceDetailsHeader(model: .init(name: nil, kind: nil))
		}
		.previewDisplayName("Special cases")
		Preview {
			ForEach(Place.Kind.ID.allCases) { kind in
				PlaceDetailsHeader(model: .init(
					name: Lorem.title,
					kind: kind
				))
			}
		}
		.previewDisplayName("Regular cases")
		Preview {
			ForEach(Place.Kind.ID.allCases) { kind in
				PlaceDetailsHeader(model: .init(
					name: Lorem.title,
					kind: kind,
					isDraft: true
				))
			}
		}
		.previewDisplayName("Drafts")
	}
	
}
