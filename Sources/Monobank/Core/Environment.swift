//
//  Environment.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

final class Environment {
	var baseURL: URL {
		guard let url = URL(string: "https://api.monobank.ua/") else {
			fatalError("Failed to setup invalid URL")
		}
		return url
	}
	
	var authorizedCacheDirectoryName: String { "MonobankAuhtorized" }
	var unauthorizedCacheDirectoryName: String { "MonobankUnauhtorized" }
	
	var authorizedCacheExpiry: TimeInterval { 60 }
	var unauthorizedCacheExpiry: TimeInterval { 60*5 }
}
