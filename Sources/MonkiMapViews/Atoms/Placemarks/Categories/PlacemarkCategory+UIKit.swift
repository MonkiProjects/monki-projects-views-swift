//
//  PlacemarkCategory+UIKit.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(UIKit)
import UIKit
import MonkiMapModel

extension Placemark.Category {
	
	@available(iOS 11.0, *)
	public var uiColor: UIColor { UIColor(named: rawValue, in: .module, compatibleWith: nil) ?? .systemRed }
	
	@available(iOS 11.0, *)
	public func uiColor(placemarkState: Placemark.State) -> UIColor {
		if placemarkState.isLocal {
			return .systemGray
		} else {
			return self.uiColor
		}
	}
	
}
#endif
