//
//  UsernameView.swift
//  MonkiProjectsUserViews
//
//  Created by Rémi Bardon on 28/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI
import Common

// MARK: - View

struct UsernameView: View {
	
	private let username: String
	
	init(_ username: String) {
		self.username = username
	}
	
	var body: some View {
		Text("@\(username)")
			.bold()
			.font(.title3)
	}
	
}

#if DEBUG
import LoremSwiftum

struct UsernameView_Previews: PreviewProvider {
	
	static var previews: some View {
		let previews = List {
			ForEach(ContentSizeCategory.previewCategories, id: \.self) { sizeCategory in
				UsernameView(Lorem.fullName.asUsername())
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
