//
//  KnownURLsTests.swift
//  CommonTests
//
//  Created by Rémi Bardon on 28/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import XCTest
@testable import Common

final class KnownURLsTests: XCTestCase {
	
	func testURLsDoNotThrow() {
		_ = KnownURLs.defaultAvatar
	}
	
}
