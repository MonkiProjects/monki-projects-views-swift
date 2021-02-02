//
//  SportLevelView.swift
//  UserViews
//
//  Created by Rémi Bardon on 14/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

import SwiftUI
import MonkiProjectsCommonViews
import MonkiProjectsModel

// MARK: - View

public struct SportLevelView: View {
	
	@Environment(\.sizeCategory) private var sizeCategory
	
	private let sport: Sport, level: SportLevel
	
	public init(sport: Sport, level: SportLevel) {
		self.sport = sport
		self.level = level
	}
	
	public var body: some View {
		AccessibleHStack {
			progressBar
			label
		}
		.foregroundColor(CircularProgressView.defaultColors[Int(level.rawValue)])
		.font(.system(.title3, design: .rounded))
	}
	
	@ViewBuilder
	private var progressBar: some View {
		VStack(alignment: sizeCategory.isAccessibilityCategory ? .center : .leading) {
			CircularProgressView(value: level.rawValue)
		}
	}
	
	@ViewBuilder
	private var label: some View {
		VStack(alignment: sizeCategory.isAccessibilityCategory ? .center : .leading) {
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
//		let levels: [Sport: SportLevel] = [
//			.parkour: .professional,
//			.freerunning: .advanced,
//			.tricking: .intermediate,
//			.bouldering: .beginner,
//			.gymnastics: .neverTried,
//		]
//		let examples = ForEach(Array(levels.keys), id: \.self) { sport in
//			SportLevelView(sport: sport, level: levels[sport]!)
//		}
//		let examples = SportLevelView(sport: .parkour, level: .professional)
//
//		let preview = List {
//			ForEach(ContentSizeCategory.previewCategories, id: \.self) { sizeCategory in
//				Section(header: Text(String(describing: sizeCategory))) {
//					ScrollView(.horizontal) { examples }
//						.environment(\.sizeCategory, sizeCategory)
//				}
//			}
//		}
//
//		return Group {
//			preview
//				.previewDisplayName("Light")
//			preview
//				.preferredColorScheme(.dark)
//				.previewDisplayName("Dark")
//		}
//		Text(Sport.parkour.name)
		Text(Sport.parkour.rawValue)
	}
	
} 
#endif
