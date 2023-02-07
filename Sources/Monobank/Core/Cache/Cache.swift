//
//  Cache.swift
//  
//
//  Created by Dima Shvets on 06.02.2023.
//

import Foundation

final class Cache {
	
	private let environment: Environment
	
	init(environment: Environment) {
		self.environment = environment
	}
	
	func authorized<T: Codable>() throws -> CacheService<T> {
		try CacheService<T>(name: environment.authorizedCacheDirectoryName, expiry: environment.authorizedCacheExpiry)
	}
	
	func unauthorized<T: Codable>() throws -> CacheService<T> {
		try CacheService<T>(name: environment.unauthorizedCacheDirectoryName, expiry: environment.unauthorizedCacheExpiry)
	}
	
}

extension Cache {
	enum Key: String {
		case currency
		case clientInfo
		case statement
	}
}

