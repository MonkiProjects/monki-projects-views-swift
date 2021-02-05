//
//  AvatarViewModifier.swift
//  MonkiProjectsUserViews
//
//  Created by Rémi Bardon on 28/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI

struct AvatarViewModifier: ViewModifier {
	
	private let size: CGFloat
	
	private var borderColor: Color {
		#if os(iOS)
		return Color(.separator)
		#else
		return Color(.separatorColor)
		#endif
	}
	
	init(size: CGFloat) {
		self.size = size
	}
	
	func body(content: Content) -> some View {
		content
			.frame(width: size, height: size)
			.background(AvatarPlaceholderView(size: size))
			.clipShape(Circle())
			.overlay(Circle().strokeBorder(borderColor))
	}
	
}

extension View {
	
	func avatar(size: CGFloat) -> some View {
		modifier(AvatarViewModifier(size: size))
	}
	
}
