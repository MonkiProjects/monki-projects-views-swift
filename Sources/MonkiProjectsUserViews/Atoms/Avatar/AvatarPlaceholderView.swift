//
//  AvatarPlaceholderView.swift
//  MonkiProjectsUserViews
//
//  Created by Rémi Bardon on 28/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI

// MARK: - View

struct AvatarPlaceholderView: View {
	
	private let size: CGFloat
	
	private var backgroundColor: Color {
		#if os(iOS)
		return Color(.secondarySystemFill)
		#else
		return Color(.lightGray)
		#endif
	}
	
	private var foregroundColor: Color {
		return Color(.darkGray)
	}
	
	init(size: CGFloat) {
		self.size = size
	}
	
	var body: some View {
		Image(systemName: "person.fill")
			.frame(width: size, height: size)
			.font(.system(size: size/2))
			.foregroundColor(foregroundColor)
			.background(backgroundColor)
	}
	
}

// MARK: - Previews

#if DEBUG
struct AvatarPlaceholderView_Previews: PreviewProvider {
	
	private static let size: CGFloat = 48
	
	static var previews: some View {
		AvatarPlaceholderView(size: size)
			.padding()
			.previewLayout(.sizeThatFits)
	}
	
}
#endif
