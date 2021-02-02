//
//  AvatarFromURLView.swift
//  UserViews
//
//  Created by Rémi Bardon on 14/08/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import SwiftUI
import Common
import FetchImage

// MARK: - View

struct AvatarFromURLView: View {
	
	@ObservedObject private var image: FetchImage
	private let size: CGFloat
	
	init(avatarUrl: URL?, size: CGFloat) {
		self.image = FetchImage(url: avatarUrl ?? KnownURLs.defaultAvatar)
		self.size = size
	}
	
	var body: some View {
		avatar
			.avatar(size: size)
			.onAppear {
				image.priority = .normal
				image.fetch() // Restart the request if previous download failed
			}
			.onDisappear {
				image.priority = .low
			}
	}
	
	@ViewBuilder
	private var avatar: some View {
		if let view = image.view {
			view.resizable().scaledToFill()
		} else {
			Color.clear
		}
	}
	
}

// MARK: - Previews

#if DEBUG
struct AvatarFromURLView_Previews: PreviewProvider {
	
	private static let size: CGFloat = 300
	
	static var previews: some View {
		List {
			Section(header: Text("Valid")) {
				// FIXME: Point to another URL than default
				AvatarFromURLView(avatarUrl: KnownURLs.defaultAvatar, size: size)
			}
			Section(header: Text("No URL")) {
				AvatarFromURLView(avatarUrl: nil, size: size)
			}
			Section(header: Text("No image at URL")) {
				AvatarFromURLView(avatarUrl: URL(string: "https://no-image-here.com"), size: size)
			}
		}
		.listStyle(InsetListStyle())
	}
	
}
#endif
