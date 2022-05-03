//
//  FlatAvatarsTests.swift
//  MonkiProjectsViewsTests
//
//  Created by Rémi Bardon on 28/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import XCTest
#if canImport(UIKit)
import UIKit
#endif
import Common
@testable import MonkiProjectsViews

final class FlatAvatarsTests: XCTestCase {
	
	func testAllImagesExist() throws {
		for image in Images.FlatAvatars.allCases {
			let bundle = try XCTUnwrap(MonkiProjectsViews.localBundle)
			#if canImport(UIKit)
			XCTAssertNotNil(UIImage(named: image.rawValue, in: bundle, with: nil), image.rawValue)
			#else
			XCTAssertNotNil(bundle.image(forResource: image.rawValue), image.rawValue)
			#endif
		}
	}
	
}
