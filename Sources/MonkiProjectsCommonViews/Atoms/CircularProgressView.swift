//
//  CircularProgressView.swift
//  MonkiProjectsCommonViews
//
//  Created by Rémi Bardon on 29/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI
import Common

// MARK: - View

public struct CircularProgressView: View {
	
	public static let defaultColors: [Color] = [.gray, .red, .orange, .yellow, .init(.systemTeal)]
	
	@Environment(\.sizeCategory) private var sizeCategory
	
	@ScaledMetric private var progressBarSize: CGFloat = 48
	@ScaledMetric private var progressBarWidth: CGFloat = 6
	
	private static var backgroundColor: Color {
		#if os(iOS)
		return Color(.systemFill)
		#else
		return Color(.lightGray)
		#endif
	}
	
	private let value: UInt8
	private let colors: [Color]
	
	public init(value: UInt8, colors: [Color] = Self.defaultColors) {
		self.value = value
		self.colors = colors
	}
	
	public var body: some View {
		progressBar
			.foregroundColor(color(for: value))
			.font(.system(.title3, design: .rounded))
	}
	
	@ViewBuilder
	private var progressBar: some View {
		ZStack {
			Circle()
				.addPartialOutline(
					Self.backgroundColor,
					width: progressBarWidth
				)
			Circle()
				.addPartialOutline(
					color(for: value),
					width: progressBarWidth,
					trim: CGFloat(value) / CGFloat(colors.count - 1)
				)
			Text("\(value)")
		}
		.frame(width: progressBarSize, height: progressBarSize)
	}
	
	private func color(for value: UInt8) -> Color {
		if value < colors.count {
			return colors[Int(value)]
		} else {
			return colors.last ?? .gray
		}
	}
	
}

// MARK: - Previews

#if DEBUG
struct SportLevelView_Previews: PreviewProvider {
	
	static var previews: some View {
		let stack = HStack {
			ForEach(UInt8(0)...4, id: \.self) { n in
				CircularProgressView(value: n)
			}
		}
		.padding()
		
		let previews = List {
			ForEach(ContentSizeCategory.previewCategories, id: \.self) { sizeCategory in
				Section(header: Text(String(describing: sizeCategory))) {
					ScrollView(.horizontal) { stack }
						.environment(\.sizeCategory, sizeCategory)
				}
			}
		}
		
		let customColors: [Color] = [.red, .orange, .blue, .purple]
		
		return Group {
			previews
				.previewDisplayName("Default")
			HStack {
				ForEach(UInt8(0)...5, id: \.self) { n in
					CircularProgressView(value: n, colors: customColors)
				}
			}
			.padding()
			.previewLayout(.sizeThatFits)
			.previewDisplayName("Custom Colors")
			stack
				.previewLayout(.sizeThatFits)
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark")
		}
	}
	
}
#endif
