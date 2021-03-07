//
//  PlacemarkPublic+UIKit.swift
//  MonkiMapModel
//
//  Created by Rémi Bardon on 01/10/2020.
//  Copyright © 2020 Monki Projects. All rights reserved.
//

#if canImport(UIKit)
import UIKit
import MonkiMapModel

extension Placemark.Public {
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, *)
	public var uiIcon: UIImage? {
		if state == .draft {
			return UIImage(systemName: "doc.text")!
		} else if let uiIcon = self.kind.uiIcon {
			return uiIcon
		} else {
			return nil
		}
	}
	
	/// Icons from [Icons8](https://icons8.com)
	@available(iOS 13.0, *)
	public var uiGlyph: UIImage? {
		if state == .draft {
			return UIImage(systemName: "doc.text")
		}
		
		return self.kind.uiGlyph
	}
	
	@available(iOS 13.0, *)
	public var uiColor: UIColor {
		return self.category.uiColor(placemarkState: state)
	}
	
}
#endif
