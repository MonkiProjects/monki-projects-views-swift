//
//  KnownURLs.swift
//  Common
//
//  Created by Rémi Bardon on 27/01/2021.
//  Copyright © 2021 Monki Projects. All rights reserved.
//

import Foundation

public enum KnownURLs {
	
	public static var defaultAvatar: URL {
		return URL(staticString: "https://abs.twimg.com/sticky/default_profile_images/default_profile_200x200.png")
		
		// TODO: Replace by own default user avatar
//		return URL(staticString: "https://monkiprojects.com/images/user-avatar-placeholder.jpg")
	}
	
}
