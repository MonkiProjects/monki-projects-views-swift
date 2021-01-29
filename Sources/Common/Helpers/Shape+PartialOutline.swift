//
//  Shape+PartialOutline.swift
//  Common
//
//  Created by Rémi Bardon on 29/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import SwiftUI

public extension Shape {
	
	func addPartialOutline(_ color: Color, width lineWidth: CGFloat = 1, trim: CGFloat = 1) -> some View {
		self
			.trim(from: 0, to: trim)
			.rotation(.degrees(-90))
			.stroke(
				color,
				style: StrokeStyle(
					lineWidth: lineWidth,
					lineCap: CGLineCap.round
				)
			)
			// Don't allow stroke to go outside of bounds
			.padding(lineWidth/2)
	}
	
}
