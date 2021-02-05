//
//  AccessibleHStack.swift
//  MonkiProjectsCommonViews
//
//  Created by Rémi Bardon on 28/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI

// MARK: - View

public struct AccessibleHStack<Content: View>: View {
	
	@Environment(\.sizeCategory) private var sizeCategory
	
	private let verticalAlignment: VerticalAlignment
	private let horizontalAlignment: HorizontalAlignment
	private let spacing: CGFloat?
	private let content: () -> Content
	
	public init(
		verticalAlignment: VerticalAlignment = .center,
		horizontalAlignment: HorizontalAlignment = .center,
		spacing: CGFloat? = nil,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.verticalAlignment = verticalAlignment
		self.horizontalAlignment = horizontalAlignment
		self.spacing = spacing
		self.content = content
	}
	
	public var body: some View {
		#if os(iOS)
		if sizeCategory.isAccessibilityCategory {
			vStack
		} else {
			hStack
		}
		#else
		hStack
		#endif
	}
	
	private var vStack: some View {
		VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
	}
	
	private var hStack: some View {
		HStack(alignment: verticalAlignment, spacing: spacing, content: content)
	}
	
}

// MARK: - Previews

#if DEBUG
import LoremSwiftum

struct AccessibleHStack_Previews: PreviewProvider {
	
	static var previews: some View {
		List {
			ForEach(ContentSizeCategory.previewCategories, id: \.self) { sizeCategory in
				AccessibleHStack(
					verticalAlignment: .top,
					horizontalAlignment: .leading,
					spacing: 16
				) {
					Text(Lorem.title)
					Text(Lorem.title)
				}
				.padding()
				.environment(\.sizeCategory, sizeCategory)
			}
		}
	}
	
}
#endif
