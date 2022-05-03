//
//  AvatarFromAssetsView.swift
//  MonkiProjectsViews
//
//  Created by Rémi Bardon on 14/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import SwiftUI

// MARK: - View

struct AvatarFromAssetsView: View {
	
	private let assetName: String
	private let size: CGFloat
	
	init(_ assetName: String, size: CGFloat) {
		self.assetName = assetName
		self.size = size
	}
	
	var body: some View {
		Image(assetName, bundle: .fixedModule)
			.resizable()
			.scaledToFill()
			.avatar(size: size)
	}
	
}

// MARK: - Previews

#if DEBUG
struct AvatarFromAssetsView_Previews: PreviewProvider {
	
	private static let size: CGFloat = 300
	
	static var previews: some View {
		List {
			Section(header: Text("Valid")) {
				AvatarView.fromAsset("001-man", size: size)
				AvatarView.fromAsset("050-woman", size: size)
			}
			Section(header: Text("Invalid")) {
				AvatarView.fromAsset("invalid", size: size)
			}
		}
		.listStyle(InsetListStyle())
	}
	
}
#endif
