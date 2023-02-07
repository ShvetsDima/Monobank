//
//  KeychainStorage.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation
import KeychainAccess

protocol KeychainStorage {
	func value(for key: String) -> String?
	func set(value: String, for key: String)
	func removeValue(for key: String)
	func clear()
}

final class KeychainService: KeychainStorage {
	
	private let keychain: Keychain
	
	init() {
		self.keychain = Keychain()
	}
	
	func value(for key: String) -> String? {
		keychain[key]
	}
	
	func set(value: String, for key: String) {
		keychain[key] = value
	}
	
	func removeValue(for key: String) {
		keychain[key] = nil
	}
	
	func clear() {
		try? keychain.removeAll()
	}
}

extension KeychainService {
	enum Key: String {
		case token
	}
}
