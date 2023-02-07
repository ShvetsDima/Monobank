//
//  AuthenticationService.swift
//  Monobank
//
//  Created by Dima Shvets on 29.01.2023.
//

import Foundation

final class AuthenticationService: AuthenticationUseCase {
    
    private let context: Context
    
    init(context: Context) {
        self.context = context
    }
    
	var apiToken: String? {
		context.keychain.value(for: KeychainService.Key.token.rawValue)
	}
    
    func authenticateWith(_ apiToken: String) {
		context.keychain.set(value: apiToken, for: KeychainService.Key.token.rawValue)
    }
	
	func logout() {
		context.keychain.clear()
	}
}
