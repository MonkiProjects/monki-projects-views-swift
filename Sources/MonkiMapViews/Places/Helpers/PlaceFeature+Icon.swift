//
//  PlaceProperty+Icon.swift
//  MonkiMapViews
//
//  Created by Rémi Bardon on 14/05/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import Foundation
import MonkiMapDTO

#if canImport(SwiftUI)
import SwiftUI
#if canImport(UIKit)
import UIKit
#endif
import MonkiMapDTO

extension Place.Feature {
	
	@ViewBuilder
	private static func icon<V: View>(_ icon: () -> V, if condition: Bool) -> some View {
		if condition { icon() } else { EmptyView() }
	}
	
	private static func placeholderIcon() -> some View {
		Image(systemName: "questionmark.square.dashed")
	}
	
	private static func errorIcon() -> some View {
		Image(systemName: "exclamationmark.triangle")
	}
	
	#if canImport(UIKit)
	public var icon: Image {
		Image(self.id, bundle: .fixedModule)
	}
	#else
	@ViewBuilder
	public func icon(orPlaceholder: Bool = false) -> some View {
		if self.hasSystemIcon {
			Image(self.id, bundle: .fixedModule)
		} else {
			AsyncImage(url: self.iconUrl) { phase in
				switch phase {
				case .success(let image):
					image
				case .failure:
					Self.icon(Self.errorIcon, if: orPlaceholder)
				case .empty:
					Self.icon(Self.placeholderIcon, if: orPlaceholder)
				@unknown default:
					Self.icon(Self.errorIcon, if: orPlaceholder)
				}
			}
		}
	}
	#endif
	
}
#endif
