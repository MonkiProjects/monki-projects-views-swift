//
//  PlaceCard.swift
//  MonkiMapViews
//
//  Created by Rémi Bardon on 18/07/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI
import MonkiMapDTO

public struct PlaceCard: View {
	
	private let model: Model
	
	public init(model: Model) {
		self.model = model
	}
	
	public var body: some View {
		VStack(spacing: 0) {
			PlaceDetailsHeader(model: model.detailsHeaderModel)
				.padding(8)
		}
		.compositingGroup()
		.buttonStyle(.plain)
		.foregroundColor(.primary)
	}
	
}

extension PlaceCard {
	
	public struct Model {
		
		public let detailsHeaderModel: PlaceDetailsHeader.Model
		
		public init(detailsHeaderModel: PlaceDetailsHeader.Model) {
			self.detailsHeaderModel = detailsHeaderModel
		}
		
	}
	
}

import LoremSwiftum

public struct PlaceCard_Previews: PreviewProvider {
	
	private static let spacing: CGFloat = 12
	
	public static var previews: some View {
		NavigationView {
			List {
				ForEach(Place.Kind.ID.allCases, id: \.rawValue) { kind in
					VStack(spacing: 0) {
						PlaceCard(model: .init(
							detailsHeaderModel: .init(name: Lorem.title, kind: kind)
						))
						Divider()
					}
				}
				.onDelete(perform: { _ in })
				.listRowInsets(EdgeInsets())
				.listRowSeparator(.hidden)
				.listSectionSeparator(.visible)
			}
			.listStyle(.grouped)
			.navigationTitle(Text("Places"))
		}
		NavigationView {
			ScrollView {
				LazyVGrid(
					columns: [GridItem(.adaptive(minimum: 256), spacing: Self.spacing, alignment: .top)],
					spacing: Self.spacing
				) {
					Group {
						PlaceCard(model: .init(
							detailsHeaderModel: .init(name: Lorem.title, kind: nil)
						))
						PlaceCard(model: .init(
							detailsHeaderModel: .init(name: nil, kind: .trainingSpot)
						))
						PlaceCard(model: .init(
							detailsHeaderModel: .init(name: nil, kind: nil)
						))
						ForEach(Place.Kind.ID.allCases, id: \.rawValue) { kind in
							PlaceCard(model: .init(
								detailsHeaderModel: .init(name: Lorem.title, kind: kind)
							))
						}
					}
					.modifier(CardModifier())
				}
				.padding(8)
			}
			.navigationTitle(Text("Places"))
		}
//		.previewInterfaceOrientation(.landscapeLeft)
	}
	
}
