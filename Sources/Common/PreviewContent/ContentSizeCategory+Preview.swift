//
//  ContentSizeCategory+Preview.swift
//  Common
//
//  Created by Rémi Bardon on 26/09/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if DEBUG
import SwiftUI

public extension ContentSizeCategory {
	
	static var previewCategories: [Self] {
		return [.extraSmall, .large, .accessibilityLarge, .accessibilityExtraExtraExtraLarge]
	}
	
}
#endif
