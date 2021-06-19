//
//  SportLevelView.swift
//  MonkiProjectsViews
//
//  Created by Rémi Bardon on 14/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import SwiftUI
import MonkiProjectsModel

// MARK: - View

public struct SportLevelView: View {
	
	@Environment(\.sizeCategory) private var sizeCategory
	
	private let sport: Sport, level: SportLevel
	
	public init(sport: Sport, level: SportLevel) {
		self.sport = sport
		self.level = level
	}
	
	@ViewBuilder
	public var body: some View {
		#if os(iOS)
		let alignment: Alignment = sizeCategory.isAccessibilityCategory ? .center : .leading
		#else
		let alignment: Alignment = .leading
		#endif
		
		content
			.frame(maxWidth: .infinity, alignment: alignment)
	}
	
	@ViewBuilder
	private var content: some View {
		AccessibleHStack {
			progressBar
			label
		}
		.foregroundColor(CircularProgressView.defaultColors[Int(level.rawValue)])
		.font(.system(.title3, design: .rounded))
	}
	
	@ViewBuilder
	private var progressBar: some View {
		CircularProgressView(value: level.rawValue)
	}
	
	@ViewBuilder
	private var label: some View {
		#if os(iOS)
		let alignment: HorizontalAlignment = sizeCategory.isAccessibilityCategory ? .center : .leading
		#else
		let alignment: HorizontalAlignment = .leading
		#endif
		
		VStack(alignment: alignment) {
			Text(sport.name)
				.foregroundColor(.secondary)
			Text(level.title)
		}
	}
	
}

// MARK: - Previews

#if DEBUG
struct SportLevelView_Previews: PreviewProvider {
	
	static var previews: some View {
		let values: [(sport: Sport, level: SportLevel)] = [
			(.parkour, .professional),
			(.freerunning, .advanced),
			(.tricking, .intermediate),
			(.bouldering, .beginner),
			(.gymnastics, .neverTried),
		]
		let examples = ForEach(values, id: \.sport) { pair in
			SportLevelView(sport: pair.sport, level: pair.level)
		}
		
		let preview = List {
			ForEach(ContentSizeCategory.previewCategories, id: \.self) { sizeCategory in
				Section(header: Text(String(describing: sizeCategory))) {
					examples
				}
				.environment(\.sizeCategory, sizeCategory)
			}
		}
		
		return Group {
			preview
				.previewDisplayName("Light")
			preview
				.preferredColorScheme(.dark)
				.previewDisplayName("Dark")
		}
	}
	
} 
#endif
