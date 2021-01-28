//
//  Images.swift
//  Common
//
//  Created by Rémi Bardon on 02/10/2019.
//  Copyright © 2019 Monki Projects. All rights reserved.
//

#if canImport(UIKit)
import UIKit.UIImage
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif

public protocol ImageAsset {
	
	var rawValue: String { get }
	
	#if canImport(UIKit)
	var uiImage: UIImage { get }
	#endif
	
	#if canImport(SwiftUI)
	var image: Image { get }
	#endif
	
}

public extension ImageAsset {
	
	#if canImport(UIKit)
	var uiImage: UIImage { UIImage(named: rawValue)! }
	#endif
	
	#if canImport(SwiftUI)
	var image: Image { Image(rawValue) }
	#endif
	
}

public enum Images {}
