//
//  AvatarView.swift
//  MonkiProjectsUserViews
//
//  Created by Rémi Bardon on 14/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import SwiftUI
import Common

// MARK: - View

public enum AvatarView {
	
	public static func fromAsset(_ assetName: String, size: CGFloat) -> some View {
		AvatarFromAssetsView(assetName, size: size)
	}
	
	public static func fromURL(_ url: URL?, size: CGFloat) -> some View {
		AvatarFromURLView(avatarUrl: url, size: size)
	}
	
}

// MARK: - Previews

#if DEBUG
struct AvatarView_Previews: PreviewProvider {
	
	private static let size: CGFloat = 48
	
	static var previews: some View {
		let previews = List {
			Section(header: Text("From Assets")) {
				AvatarView.fromAsset("001-man", size: size)
				AvatarView.fromAsset("050-woman", size: size)
			}
			Section(header: Text("From URL")) {
				AvatarView.fromURL(KnownURLs.defaultAvatar, size: size)
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
