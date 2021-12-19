//
//  CardModifier.swift
//  MonkiMapViews
//
//  Created by Rémi Bardon on 18/12/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI

public struct CardModifier: ViewModifier {
	
	private static var backgroundColor = Color(.systemBackground)
	
	public func body(content: Content) -> some View {
		content
			.background(Self.backgroundColor)
			.cornerRadius(16)
			.shadow(color: Color.black.opacity(0.2), radius: 4, y: 2)
	}
	
}
