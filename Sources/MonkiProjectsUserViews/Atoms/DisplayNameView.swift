//
//  DisplayNameView.swift
//  UserViews
//
//  Created by Rémi Bardon on 28/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI
import Common

// MARK: - View

struct DisplayNameView: View {
	
	private let displayName: String
	private let country: String?
	
	init(_ displayName: String, country: String? = nil) {
		self.displayName = displayName
		self.country = country
	}
	
	var body: some View {
		Text("\(Flag.of(country)) \(displayName)")
			.font(.title2)
	}
	
}

#if DEBUG
import LoremSwiftum

struct DisplayNameView_Previews: PreviewProvider {
	
	static var previews: some View {
		let previews = List {
			ForEach(ContentSizeCategory.previewCategories, id: \.self) { sizeCategory in
				DisplayNameView(Lorem.fullName)
					.environment(\.sizeCategory, sizeCategory)
			}
		}
		
		return Group {
			previews
				.previewDisplayName("Light")
			previews
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark")
		}
	}
	
}
#endif
