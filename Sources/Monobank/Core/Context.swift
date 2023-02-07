//
//  Context.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

final class Context {
	
	let environment: Environment
	let keychain: KeychainStorage
	let network: Network
	let cache: Cache
	
	init(environment: Environment) {
		self.environment = environment
		self.keychain = KeychainService()
		self.network = Network(environment: environment, keychain: keychain)
		self.cache = Cache(environment: environment)
	}
	
}

