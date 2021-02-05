//
//  UserSmallDetailsView.swift
//  MonkiProjectsUserViews
//
//  Created by Rémi Bardon on 14/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import SwiftUI
import MonkiProjectsCommonViews

// MARK: - View

public struct UserSmallDetailsView: View {
	
	public enum AvatarSource {
		case url(URL?), asset(name: String)
	}
	
	@ScaledMetric private var avatarSize: CGFloat = 48
	
	private let avatarSource: AvatarSource
	private let country: String?
	private let displayName: String
	private let username: String
	
	public init(
		source: AvatarSource,
		country: String? = nil,
		displayName: String,
		username: String
	) {
		self.avatarSource = source
		self.country = country
		self.displayName = displayName
		self.username = username
	}
	
	public var body: some View {
		AccessibleHStack(horizontalAlignment: .leading, spacing: 8) {
			avatar
			details
		}
	}
	
	@ViewBuilder
	private var avatar: some View {
		switch avatarSource {
		case .url(let url):
			AvatarView.fromURL(url, size: avatarSize)
		case .asset(let name):
			AvatarView.fromAsset(name, size: avatarSize)
		}
	}
	
	@ViewBuilder
	private var details: some View {
		VStack(alignment: .leading) {
			DisplayNameView(displayName, country: country)
			UsernameView(username)
		}
	}
	
}

// MARK: - Previews

#if DEBUG
import LoremSwiftum

struct UserSmallDetailsView_Previews: PreviewProvider {
	
	static var previews: some View {
		let previews = List {
			Section(header: Text("With data")) {
				ForEach(ContentSizeCategory.previewCategories, id: \.self) { sizeCategory in
					let name = Lorem.fullName
					UserSmallDetailsView(
						source: .asset(name: "001-man"),
						country: "FR",
						displayName: name,
						username: name.asUsername()
					)
					.environment(\.sizeCategory, sizeCategory)
				}
			}
			Section(header: Text("Doubled")) {
				ForEach(ContentSizeCategory.previewCategories, id: \.self) { sizeCategory in
					let name = Lorem.fullName
					UserSmallDetailsView(
						source: .asset(name: "001-man"),
						country: "FR",
						displayName: name.times(2, separator: " "),
						username: name.times(2, separator: " ").asUsername()
					)
					.environment(\.sizeCategory, sizeCategory)
				}
			}
			Section(header: Text("Default")) {
				ForEach(ContentSizeCategory.previewCategories, id: \.self) { sizeCategory in
					let name = Lorem.fullName
					UserSmallDetailsView(
						source: .url(nil),
						country: nil,
						displayName: name,
						username: name.asUsername()
					)
					.environment(\.sizeCategory, sizeCategory)
				}
			}
		}
		.listStyle(InsetListStyle())
		
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
