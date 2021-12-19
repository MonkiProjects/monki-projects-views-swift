//
//  PlaceKindPicker.swift
//  MonkiMap
//
//  Created by Rémi Bardon on 11/07/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI
import MonkiMapDTO

public struct PlaceKindPicker: View {
	
	public typealias Element = Place.Kind.ID
	
	private static let kinds: [Element] = Element.nonDefaultCases
	
	@Binding private var kind: Element?
	
	public init(kind: Binding<Element?>) {
		self._kind = kind
	}
	
	public var body: some View {
		VStack(spacing: 4) {
			picker()
			label()
		}
	}
	
	private func picker() -> some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(alignment: .top, spacing: 16) {
				ForEach(Self.kinds, content: kindView(for:))
			}
			.padding(.horizontal)
			.padding(.horizontal, 8) // Additional padding for circle outline
			.padding(.top, 8)
		}
	}
	
	private func label() -> some View {
		Text(kind?.optionalTitle() ?? "Place kind not selected")
			.font(.title3.bold())
			.padding(.horizontal)
	}
	
	private func kindView(for kind: Element?) -> some View {
		Button {
			self.kind = self.kind == kind ? nil : kind
		} label: {
			VStack(spacing: 8) {
				kindIcon(for: kind)
				kindLabel(for: kind)
			}
		}
		.buttonStyle(.plain)
	}
	
	private func kindIcon(for kind: Element?) -> some View {
		PlaceKindIcon(for: kind)
			.frame(width: 80, height: 80)
			.overlay {
				if kind == self.kind {
					Circle()
						.stroke(Color(.separator), lineWidth: 4)
						.scaleEffect(1.15)
				}
			}
	}
	
	private func kindLabel(for kind: Element?) -> some View {
		Text(kind?.optionalTitle() ?? "error")
			.multilineTextAlignment(.center)
			.font(.footnote)
			.minimumScaleFactor(0.5)
			.frame(width: 80)
	}
	
}

internal struct PlaceKindPicker_Previews: PreviewProvider {
	
	private struct Preview: View {
		
		@State private var kind: Place.Kind.ID? = .outdoorParkourPark
		
		var body: some View {
			PlaceKindPicker(kind: $kind)
		}
		
	}
	
	static var previews: some View {
		Preview()
	}
	
}
